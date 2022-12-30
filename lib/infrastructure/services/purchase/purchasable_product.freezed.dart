// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchasable_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasableProduct {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  ProductStatus get status => throw _privateConstructorUsedError;
  ProductDetails get productDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasableProductCopyWith<PurchasableProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasableProductCopyWith<$Res> {
  factory $PurchasableProductCopyWith(
          PurchasableProduct value, $Res Function(PurchasableProduct) then) =
      _$PurchasableProductCopyWithImpl<$Res, PurchasableProduct>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String price,
      ProductStatus status,
      ProductDetails productDetails});
}

/// @nodoc
class _$PurchasableProductCopyWithImpl<$Res, $Val extends PurchasableProduct>
    implements $PurchasableProductCopyWith<$Res> {
  _$PurchasableProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? status = null,
    Object? productDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      productDetails: null == productDetails
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as ProductDetails,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchasableProductCopyWith<$Res>
    implements $PurchasableProductCopyWith<$Res> {
  factory _$$_PurchasableProductCopyWith(_$_PurchasableProduct value,
          $Res Function(_$_PurchasableProduct) then) =
      __$$_PurchasableProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String price,
      ProductStatus status,
      ProductDetails productDetails});
}

/// @nodoc
class __$$_PurchasableProductCopyWithImpl<$Res>
    extends _$PurchasableProductCopyWithImpl<$Res, _$_PurchasableProduct>
    implements _$$_PurchasableProductCopyWith<$Res> {
  __$$_PurchasableProductCopyWithImpl(
      _$_PurchasableProduct _value, $Res Function(_$_PurchasableProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? status = null,
    Object? productDetails = null,
  }) {
    return _then(_$_PurchasableProduct(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      productDetails: null == productDetails
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as ProductDetails,
    ));
  }
}

/// @nodoc

class _$_PurchasableProduct extends _PurchasableProduct {
  _$_PurchasableProduct(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.status,
      required this.productDetails})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String price;
  @override
  final ProductStatus status;
  @override
  final ProductDetails productDetails;

  @override
  String toString() {
    return 'PurchasableProduct(id: $id, title: $title, description: $description, price: $price, status: $status, productDetails: $productDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasableProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.productDetails, productDetails) ||
                other.productDetails == productDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, price, status, productDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasableProductCopyWith<_$_PurchasableProduct> get copyWith =>
      __$$_PurchasableProductCopyWithImpl<_$_PurchasableProduct>(
          this, _$identity);
}

abstract class _PurchasableProduct extends PurchasableProduct {
  factory _PurchasableProduct(
      {required final String id,
      required final String title,
      required final String description,
      required final String price,
      required final ProductStatus status,
      required final ProductDetails productDetails}) = _$_PurchasableProduct;
  _PurchasableProduct._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get price;
  @override
  ProductStatus get status;
  @override
  ProductDetails get productDetails;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasableProductCopyWith<_$_PurchasableProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
