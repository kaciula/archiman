import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'purchasable_product.freezed.dart';

@freezed
class PurchasableProduct with _$PurchasableProduct {
  factory PurchasableProduct({
    required String id,
    required String title,
    required String description,
    required String price,
    required ProductStatus status,
    required ProductDetails productDetails,
  }) = _PurchasableProduct;

  PurchasableProduct._();

  bool get isPurchased => status == ProductStatus.purchased;
}

enum ProductStatus {
  purchasable,
  purchased,
  pending,
}
