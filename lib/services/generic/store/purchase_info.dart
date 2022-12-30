import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'purchase_info.freezed.dart';

@freezed
class PurchaseInfo with _$PurchaseInfo {
  factory PurchaseInfo({
    required PurchaseDetails storeDetails,
  }) = _PurchaseInfo;

  PurchaseInfo._();

  bool get isPurchased =>
      storeDetails.status == PurchaseStatus.purchased ||
      storeDetails.status == PurchaseStatus.restored;

  bool get isError =>
      storeDetails.status == PurchaseStatus.error || storeDetails.error != null;

  bool get isItemAlreadyOwnedError =>
      storeDetails.error != null &&
      storeDetails.error!.message == 'BillingResponse.itemAlreadyOwned';

  String get productId => storeDetails.productID;
}
