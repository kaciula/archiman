import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:kt_dart/collection.dart';
import 'package:logging/logging.dart';

import 'purchasable_product.dart';

part 'purchase_service.freezed.dart';

class PurchaseService {
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  late ProductCallback _purchasedProductCallback;
  late ProductCallback _pendingProductCallback;
  ProductCallback? _pendingProductCallbackExtra;
  ProductCallback? _purchasedProductCallbackExtra;

  void listenForUpdates(ProductCallback purchasedProductCallback,
      ProductCallback pendingProductCallback) {
    _purchasedProductCallback = purchasedProductCallback;
    _pendingProductCallback = pendingProductCallback;

    _subscription = InAppPurchase.instance.purchaseStream.listen(
      _onPurchaseUpdate,
      onDone: () => _subscription?.cancel(),
      onError: (dynamic error) {
        _logger.warning('Purchase listen error: $error');
      },
    );
  }

  Future<void> _onPurchaseUpdate(
      List<PurchaseDetails> purchaseDetailsList) async {
    _logger.fine('Purchase update callback');

    for (PurchaseDetails details in purchaseDetailsList) {
      _logger
          .fine('Purchase for ${details.productID} status ${details.status}');
      switch (details.status) {
        case PurchaseStatus.pending:
          _pendingProductCallback(details.productID);
          _pendingProductCallbackExtra?.call(details.productID);
          break;
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          _purchasedProductCallback(details.productID);
          _purchasedProductCallbackExtra?.call(details.productID);
          break;
        case PurchaseStatus.error:
          _logger.warning('Purchase error');
          break;
        case PurchaseStatus.canceled:
          // Do nothing here
          break;
      }

      if (details.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(details);
      }
    }
  }

  Future<InAppProductsResult> getInAppProducts(KtSet<String> productIds) async {
    ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(productIds.asSet());
    if (response.notFoundIDs.isNotEmpty) {
      _logger.warning('Some products  not found');
      // Bug https://github.com/flutter/flutter/issues/69256
      // We query product details twice to make sure we get the details
      response =
          await InAppPurchase.instance.queryProductDetails(productIds.asSet());
      if (response.notFoundIDs.isNotEmpty) {
        _logger.warning('Some products STILL not found');
        return InAppProductsFailure(
          errorMsg:
              'Unexpected error. Could not retrieve product details from store. Please try again in a few minutes.',
        );
      }
    }
    if (response.error == null) {
      return InAppProductsSuccess(
        products: response.productDetails
            .map((ProductDetails it) => _map(it))
            .toImmutableList(),
      );
    } else {
      return InAppProductsFailure(errorMsg: response.error.toString());
    }
  }

  Future<InAppProductResult> getInAppProduct(String productId) async {
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
        return InAppProductFailure(
          errorMsg:
              'Unexpected error. Could not retrieve product details from store. Please try again in a few minutes.',
        );
      }
    }
    if (response.error == null) {
      return InAppProductSuccess(product: _map(response.productDetails[0]));
    } else {
      return InAppProductFailure(errorMsg: response.error.toString());
    }
  }

  PurchasableProduct _map(ProductDetails details) {
    return PurchasableProduct(
      id: details.id,
      title: details.title,
      description: details.description,
      price: details.price,
      status: ProductStatus.purchasable,
      productDetails: details,
    );
  }

  Future<void> buy(
    PurchasableProduct product,
    ProductCallback? purchasedProductCallback,
    ProductCallback? pendingProductCallback,
  ) async {
    _purchasedProductCallbackExtra = purchasedProductCallback;
    _pendingProductCallbackExtra = pendingProductCallback;
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: product.productDetails);
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  Future<bool> isStoreAvailable() async {
    return await InAppPurchase.instance.isAvailable();
  }

  void dispose() {
    _subscription?.cancel();
  }
}

@freezed
class InAppProductsResult with _$InAppProductsResult {
  factory InAppProductsResult.success(
      {required KtList<PurchasableProduct> products}) = InAppProductsSuccess;

  factory InAppProductsResult.failure({required String errorMsg}) =
      InAppProductsFailure;
}

@freezed
class InAppProductResult with _$InAppProductResult {
  factory InAppProductResult.success({required PurchasableProduct product}) =
      InAppProductSuccess;

  factory InAppProductResult.failure({required String errorMsg}) =
      InAppProductFailure;
}

typedef ProductCallback = void Function(String productId);

// ignore: unused_element
final Logger _logger = Logger('PurchaseService');
