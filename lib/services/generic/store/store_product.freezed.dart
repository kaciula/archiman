// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreProduct {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  ProductStatus get status => throw _privateConstructorUsedError;
  ProductDetails get productDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoreProductCopyWith<StoreProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreProductCopyWith<$Res> {
  factory $StoreProductCopyWith(
          StoreProduct value, $Res Function(StoreProduct) then) =
      _$StoreProductCopyWithImpl<$Res, StoreProduct>;
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
class _$StoreProductCopyWithImpl<$Res, $Val extends StoreProduct>
    implements $StoreProductCopyWith<$Res> {
  _$StoreProductCopyWithImpl(this._value, this._then);

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
abstract class _$$_StoreProductCopyWith<$Res>
    implements $StoreProductCopyWith<$Res> {
  factory _$$_StoreProductCopyWith(
          _$_StoreProduct value, $Res Function(_$_StoreProduct) then) =
      __$$_StoreProductCopyWithImpl<$Res>;
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
class __$$_StoreProductCopyWithImpl<$Res>
    extends _$StoreProductCopyWithImpl<$Res, _$_StoreProduct>
    implements _$$_StoreProductCopyWith<$Res> {
  __$$_StoreProductCopyWithImpl(
      _$_StoreProduct _value, $Res Function(_$_StoreProduct) _then)
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
    return _then(_$_StoreProduct(
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

class _$_StoreProduct extends _StoreProduct {
  _$_StoreProduct(
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
    return 'StoreProduct(id: $id, title: $title, description: $description, price: $price, status: $status, productDetails: $productDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreProduct &&
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
  _$$_StoreProductCopyWith<_$_StoreProduct> get copyWith =>
      __$$_StoreProductCopyWithImpl<_$_StoreProduct>(this, _$identity);
}

abstract class _StoreProduct extends StoreProduct {
  factory _StoreProduct(
      {required final String id,
      required final String title,
      required final String description,
      required final String price,
      required final ProductStatus status,
      required final ProductDetails productDetails}) = _$_StoreProduct;
  _StoreProduct._() : super._();

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
  _$$_StoreProductCopyWith<_$_StoreProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
