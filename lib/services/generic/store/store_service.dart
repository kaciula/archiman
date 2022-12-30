import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
// ignore: depend_on_referenced_packages
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
// ignore: depend_on_referenced_packages
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
// ignore: depend_on_referenced_packages
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:kt_dart/collection.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

import 'purchase_info.dart';
import 'store_product.dart';

part 'store_service.freezed.dart';

class StoreService {
  StreamSubscription<List<PurchaseDetails>>? _purchaseSub;

  late StoreUpdateCallback _onStoreUpdate;
  StoreProductUpdateCallback? _onStoreProductUpdate;
  StoreProduct? _productForCallback;

  void listen(StoreUpdateCallback onStoreUpdate) {
    _onStoreUpdate = onStoreUpdate;

    _purchaseSub = InAppPurchase.instance.purchaseStream.listen(
      _onStoreDataUpdate,
      onDone: () => _purchaseSub?.cancel(),
      onError: (dynamic error) {
        _logger.warning('Purchase listen error: $error');
      },
    );
  }

  Future<void> _onStoreDataUpdate(
      List<PurchaseDetails> purchaseDetailsList) async {
    _logger.fine('Purchase update callback');

    for (PurchaseDetails details in purchaseDetailsList) {
      _logger.fine(
          'Purchase for product ${details.productID} status ${details.status}');

      if (_productForCallback?.id == details.productID) {
        _onStoreProductUpdate?.call(PurchaseInfo(storeDetails: details));
      }

      // For error, the product id is missing but we do want to notify the caller about the error
      if (details.status == PurchaseStatus.error) {
        _onStoreProductUpdate?.call(PurchaseInfo(storeDetails: details));
      }

      if (details.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(details);
      }
    }

    _onStoreUpdate(
      purchaseDetailsList.map((PurchaseDetails it) {
        PurchaseDetails completeDetails = it;
        if (it.status == PurchaseStatus.error) {
          // For error, the product id is missing but we can fill it in because we know that last product the request mas made for
          completeDetails = PurchaseDetails(
            purchaseID: it.purchaseID,
            productID: _productForCallback?.id ?? 'n/a',
            verificationData: it.verificationData,
            transactionDate: it.transactionDate,
            status: it.status,
          );
          completeDetails.error = it.error;
        }
        return PurchaseInfo(storeDetails: completeDetails);
      }).toImmutableList(),
    );

    // Clear the product for which the last request was done
    _productForCallback = null;
    _onStoreProductUpdate = null;
  }

  Future<AvailableProductsResult> getAvailableProducts(
      KtSet<String> productIds) async {
    ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(productIds.asSet());
    if (response.notFoundIDs.isNotEmpty) {
      _logger.warning('Some products not found');
      // Bug https://github.com/flutter/flutter/issues/69256
      // We query product details twice to make sure we get the details
      response =
          await InAppPurchase.instance.queryProductDetails(productIds.asSet());
      if (response.notFoundIDs.isNotEmpty) {
        _logger.warning('Some products STILL not found');
        return AvailableProductsFailure(
          errorMsg:
              'Unexpected error. Could not retrieve product details from store. Please try again in a few minutes.',
        );
      }
    }
    if (response.error == null) {
      return AvailableProductsSuccess(
        products: response.productDetails
            .map((ProductDetails it) => _map(it))
            .toImmutableList(),
      );
    } else {
      return AvailableProductsFailure(errorMsg: response.error.toString());
    }
  }

  Future<ProductResult> getProduct(String productId) async {
    final Set<String> productIds = <String>{productId};
    ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(productIds);
    if (response.notFoundIDs.isNotEmpty) {
      _logger.warning('Product $productId not found');
      // Bug https://github.com/flutter/flutter/issues/69256
      // We query product details twice to make sure we get the details
      response = await InAppPurchase.instance.queryProductDetails(productIds);
      if (response.notFoundIDs.isNotEmpty) {
        _logger.warning('Product $productId STILL not found');
        return ProductFailure(
          errorMsg:
              'Unexpected error. Could not retrieve product details from store. Please try again in a few minutes.',
        );
      }
    }
    if (response.error == null) {
      return ProductSuccess(product: _map(response.productDetails[0]));
    } else {
      return ProductFailure(errorMsg: response.error.toString());
    }
  }

  StoreProduct _map(ProductDetails details) {
    return StoreProduct(
      id: details.id,
      title: details.title,
      description: details.description,
      price: details.price,
      status: ProductStatus.purchasable,
      productDetails: details,
    );
  }

  Future<void> buy(
    StoreProduct product,
    StoreProductUpdateCallback onStoreProductUpdate,
  ) async {
    _onStoreProductUpdate = onStoreProductUpdate;
    _productForCallback = product;
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: product.productDetails);
    if (Platform.isIOS) {
      final SKPaymentQueueWrapper paymentWrapper = SKPaymentQueueWrapper();
      final List<SKPaymentTransactionWrapper> transactions =
          await paymentWrapper.transactions();
      await Future.wait(
        transactions.map(
            (transaction) => paymentWrapper.finishTransaction(transaction)),
      );
    }
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> upgradeDowngradeSubscription(
    StoreProduct product,
    String oldSubscriptionProductId,
    StoreProductUpdateCallback onStoreProductUpdate,
  ) async {
    _onStoreProductUpdate = onStoreProductUpdate;
    _productForCallback = product;
    final PurchaseParam purchaseParam;
    if (Platform.isAndroid) {
      final GooglePlayPurchaseDetails oldPurchaseDetails =
          await _getOldSubscriptionPurchaseDetails(oldSubscriptionProductId);
      purchaseParam = GooglePlayPurchaseParam(
        productDetails: product.productDetails,
        changeSubscriptionParam: ChangeSubscriptionParam(
          oldPurchaseDetails: oldPurchaseDetails,
          prorationMode: ProrationMode.immediateWithTimeProration,
        ),
      );
    } else {
      final SKPaymentQueueWrapper paymentWrapper = SKPaymentQueueWrapper();
      final List<SKPaymentTransactionWrapper> transactions =
          await paymentWrapper.transactions();
      await Future.wait(
        transactions.map(
            (transaction) => paymentWrapper.finishTransaction(transaction)),
      );
      purchaseParam = PurchaseParam(productDetails: product.productDetails);
    }
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<GooglePlayPurchaseDetails> _getOldSubscriptionPurchaseDetails(
      String oldSubscriptionProductId) async {
    final Completer<GooglePlayPurchaseDetails?> completer = Completer();
    late final StreamSubscription<List<PurchaseDetails>> subscription;
    subscription = InAppPurchase.instance.purchaseStream.listen(
      (List<PurchaseDetails> purchaseDetailsList) {
        bool foundDetails = false;
        for (PurchaseDetails details in purchaseDetailsList) {
          _logger.fine(
              'Purchase for ${details.productID} status ${details.status}');
          if (details.status == PurchaseStatus.purchased ||
              details.status == PurchaseStatus.restored) {
            if (details.productID == oldSubscriptionProductId) {
              completer.complete(details as GooglePlayPurchaseDetails);
              foundDetails = true;
              break;
            }
          }
        }
        if (!foundDetails) {
          completer.completeError(
            Exception('Could not find previous purchased subscription details'),
          );
        }
      },
      onDone: () {
        subscription.cancel();
        completer.complete();
      },
      onError: (dynamic error) {
        _logger.warning('Purchase listen error: $error');
        completer.completeError(error);
      },
    );

    await restorePurchases();

    final GooglePlayPurchaseDetails? oldPurchaseDetails =
        await completer.future;
    subscription.cancel();
    // LATER: What happens if error in stream or old purchase is not found? Is it possible in some scenario?
    return oldPurchaseDetails!;
  }

  Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  Future<KtList<PurchaseInfo>> queryPastPurchasesOnAndroid() async {
    if (Platform.isAndroid) {
      final InAppPurchaseAndroidPlatformAddition androidAddition = InAppPurchase
          .instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final QueryPurchaseDetailsResponse pastPurchasesResponse =
          await androidAddition.queryPastPurchases();
      if (pastPurchasesResponse.error == null) {
        for (GooglePlayPurchaseDetails pastPurchase
            in pastPurchasesResponse.pastPurchases) {
          _logger.fine('old purchase status: ${pastPurchase.status}');
        }
        return pastPurchasesResponse.pastPurchases
            .map((it) => PurchaseInfo(storeDetails: it))
            .toImmutableList();
      } else {
        // LATER: What happens if error checking for past purchases?
      }
    }
    return KtList.empty();
  }

  Future<bool> isStoreAvailable() async {
    return await InAppPurchase.instance.isAvailable();
  }

  void dispose() {
    _purchaseSub?.cancel();
  }
}

@freezed
class AvailableProductsResult with _$AvailableProductsResult {
  factory AvailableProductsResult.success(
      {required KtList<StoreProduct> products}) = AvailableProductsSuccess;

  factory AvailableProductsResult.failure({required String errorMsg}) =
      AvailableProductsFailure;
}

@freezed
class ProductResult with _$ProductResult {
  factory ProductResult.success({required StoreProduct product}) =
      ProductSuccess;

  factory ProductResult.failure({required String errorMsg}) = ProductFailure;
}

typedef StoreUpdateCallback = void Function(KtList<PurchaseInfo> purchases);
typedef StoreProductUpdateCallback = void Function(PurchaseInfo purchaseInfo);
typedef StorePurchaseDetailsMatchPredicate = bool Function(String productId);

// ignore: unused_element
final Logger _logger = Logger('StoreService');
