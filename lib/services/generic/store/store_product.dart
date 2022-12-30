import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

part 'store_product.freezed.dart';

@freezed
class StoreProduct with _$StoreProduct {
  factory StoreProduct({
    required String id,
    required String title,
    required String description,
    required String price,
    required ProductStatus status,
    required ProductDetails productDetails,
  }) = _StoreProduct;

  StoreProduct._();

  bool get isPurchased => status == ProductStatus.purchased;
}

enum ProductStatus {
  purchasable,
  purchased,
  pending,
}
