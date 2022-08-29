// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PurchasableProductCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String description,
      String price,
      ProductStatus status,
      ProductDetails productDetails});
}

/// @nodoc
class _$PurchasableProductCopyWithImpl<$Res>
    implements $PurchasableProductCopyWith<$Res> {
  _$PurchasableProductCopyWithImpl(this._value, this._then);

  final PurchasableProduct _value;
  // ignore: unused_field
  final $Res Function(PurchasableProduct) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? productDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      productDetails: productDetails == freezed
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as ProductDetails,
    ));
  }
}

/// @nodoc
abstract class _$$_PurchasableProductCopyWith<$Res>
    implements $PurchasableProductCopyWith<$Res> {
  factory _$$_PurchasableProductCopyWith(_$_PurchasableProduct value,
          $Res Function(_$_PurchasableProduct) then) =
      __$$_PurchasableProductCopyWithImpl<$Res>;
  @override
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
    extends _$PurchasableProductCopyWithImpl<$Res>
    implements _$$_PurchasableProductCopyWith<$Res> {
  __$$_PurchasableProductCopyWithImpl(
      _$_PurchasableProduct _value, $Res Function(_$_PurchasableProduct) _then)
      : super(_value, (v) => _then(v as _$_PurchasableProduct));

  @override
  _$_PurchasableProduct get _value => super._value as _$_PurchasableProduct;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? productDetails = freezed,
  }) {
    return _then(_$_PurchasableProduct(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      productDetails: productDetails == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.productDetails, productDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(productDetails));

  @JsonKey(ignore: true)
  @override
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
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get price => throw _privateConstructorUsedError;
  @override
  ProductStatus get status => throw _privateConstructorUsedError;
  @override
  ProductDetails get productDetails => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasableProductCopyWith<_$_PurchasableProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
