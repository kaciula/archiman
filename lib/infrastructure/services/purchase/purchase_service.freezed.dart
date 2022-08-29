// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InAppProductsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<PurchasableProduct> products) success,
    required TResult Function(String errorMsg) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KtList<PurchasableProduct> products)? success,
    TResult Function(String errorMsg)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<PurchasableProduct> products)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InAppProductsSuccess value) success,
    required TResult Function(InAppProductsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InAppProductsSuccess value)? success,
    TResult Function(InAppProductsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InAppProductsSuccess value)? success,
    TResult Function(InAppProductsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InAppProductsResultCopyWith<$Res> {
  factory $InAppProductsResultCopyWith(
          InAppProductsResult value, $Res Function(InAppProductsResult) then) =
      _$InAppProductsResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$InAppProductsResultCopyWithImpl<$Res>
    implements $InAppProductsResultCopyWith<$Res> {
  _$InAppProductsResultCopyWithImpl(this._value, this._then);

  final InAppProductsResult _value;
  // ignore: unused_field
  final $Res Function(InAppProductsResult) _then;
}

/// @nodoc
abstract class _$$InAppProductsSuccessCopyWith<$Res> {
  factory _$$InAppProductsSuccessCopyWith(_$InAppProductsSuccess value,
          $Res Function(_$InAppProductsSuccess) then) =
      __$$InAppProductsSuccessCopyWithImpl<$Res>;
  $Res call({KtList<PurchasableProduct> products});
}

/// @nodoc
class __$$InAppProductsSuccessCopyWithImpl<$Res>
    extends _$InAppProductsResultCopyWithImpl<$Res>
    implements _$$InAppProductsSuccessCopyWith<$Res> {
  __$$InAppProductsSuccessCopyWithImpl(_$InAppProductsSuccess _value,
      $Res Function(_$InAppProductsSuccess) _then)
      : super(_value, (v) => _then(v as _$InAppProductsSuccess));

  @override
  _$InAppProductsSuccess get _value => super._value as _$InAppProductsSuccess;

  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_$InAppProductsSuccess(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as KtList<PurchasableProduct>,
    ));
  }
}

/// @nodoc

class _$InAppProductsSuccess
    with DiagnosticableTreeMixin
    implements InAppProductsSuccess {
  _$InAppProductsSuccess({required this.products});

  @override
  final KtList<PurchasableProduct> products;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InAppProductsResult.success(products: $products)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InAppProductsResult.success'))
      ..add(DiagnosticsProperty('products', products));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppProductsSuccess &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(products));

  @JsonKey(ignore: true)
  @override
  _$$InAppProductsSuccessCopyWith<_$InAppProductsSuccess> get copyWith =>
      __$$InAppProductsSuccessCopyWithImpl<_$InAppProductsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<PurchasableProduct> products) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return success(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KtList<PurchasableProduct> products)? success,
    TResult Function(String errorMsg)? failure,
  }) {
    return success?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<PurchasableProduct> products)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InAppProductsSuccess value) success,
    required TResult Function(InAppProductsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InAppProductsSuccess value)? success,
    TResult Function(InAppProductsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InAppProductsSuccess value)? success,
    TResult Function(InAppProductsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class InAppProductsSuccess implements InAppProductsResult {
  factory InAppProductsSuccess(
          {required final KtList<PurchasableProduct> products}) =
      _$InAppProductsSuccess;

  KtList<PurchasableProduct> get products => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InAppProductsSuccessCopyWith<_$InAppProductsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InAppProductsFailureCopyWith<$Res> {
  factory _$$InAppProductsFailureCopyWith(_$InAppProductsFailure value,
          $Res Function(_$InAppProductsFailure) then) =
      __$$InAppProductsFailureCopyWithImpl<$Res>;
  $Res call({String errorMsg});
}

/// @nodoc
class __$$InAppProductsFailureCopyWithImpl<$Res>
    extends _$InAppProductsResultCopyWithImpl<$Res>
    implements _$$InAppProductsFailureCopyWith<$Res> {
  __$$InAppProductsFailureCopyWithImpl(_$InAppProductsFailure _value,
      $Res Function(_$InAppProductsFailure) _then)
      : super(_value, (v) => _then(v as _$InAppProductsFailure));

  @override
  _$InAppProductsFailure get _value => super._value as _$InAppProductsFailure;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$InAppProductsFailure(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InAppProductsFailure
    with DiagnosticableTreeMixin
    implements InAppProductsFailure {
  _$InAppProductsFailure({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InAppProductsResult.failure(errorMsg: $errorMsg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InAppProductsResult.failure'))
      ..add(DiagnosticsProperty('errorMsg', errorMsg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppProductsFailure &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$InAppProductsFailureCopyWith<_$InAppProductsFailure> get copyWith =>
      __$$InAppProductsFailureCopyWithImpl<_$InAppProductsFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<PurchasableProduct> products) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return failure(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KtList<PurchasableProduct> products)? success,
    TResult Function(String errorMsg)? failure,
  }) {
    return failure?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<PurchasableProduct> products)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InAppProductsSuccess value) success,
    required TResult Function(InAppProductsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InAppProductsSuccess value)? success,
    TResult Function(InAppProductsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InAppProductsSuccess value)? success,
    TResult Function(InAppProductsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class InAppProductsFailure implements InAppProductsResult {
  factory InAppProductsFailure({required final String errorMsg}) =
      _$InAppProductsFailure;

  String get errorMsg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InAppProductsFailureCopyWith<_$InAppProductsFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InAppProductResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchasableProduct product) success,
    required TResult Function(String errorMsg) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PurchasableProduct product)? success,
    TResult Function(String errorMsg)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchasableProduct product)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InAppProductSuccess value) success,
    required TResult Function(InAppProductFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InAppProductSuccess value)? success,
    TResult Function(InAppProductFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InAppProductSuccess value)? success,
    TResult Function(InAppProductFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InAppProductResultCopyWith<$Res> {
  factory $InAppProductResultCopyWith(
          InAppProductResult value, $Res Function(InAppProductResult) then) =
      _$InAppProductResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$InAppProductResultCopyWithImpl<$Res>
    implements $InAppProductResultCopyWith<$Res> {
  _$InAppProductResultCopyWithImpl(this._value, this._then);

  final InAppProductResult _value;
  // ignore: unused_field
  final $Res Function(InAppProductResult) _then;
}

/// @nodoc
abstract class _$$InAppProductSuccessCopyWith<$Res> {
  factory _$$InAppProductSuccessCopyWith(_$InAppProductSuccess value,
          $Res Function(_$InAppProductSuccess) then) =
      __$$InAppProductSuccessCopyWithImpl<$Res>;
  $Res call({PurchasableProduct product});

  $PurchasableProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$InAppProductSuccessCopyWithImpl<$Res>
    extends _$InAppProductResultCopyWithImpl<$Res>
    implements _$$InAppProductSuccessCopyWith<$Res> {
  __$$InAppProductSuccessCopyWithImpl(
      _$InAppProductSuccess _value, $Res Function(_$InAppProductSuccess) _then)
      : super(_value, (v) => _then(v as _$InAppProductSuccess));

  @override
  _$InAppProductSuccess get _value => super._value as _$InAppProductSuccess;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_$InAppProductSuccess(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as PurchasableProduct,
    ));
  }

  @override
  $PurchasableProductCopyWith<$Res> get product {
    return $PurchasableProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$InAppProductSuccess
    with DiagnosticableTreeMixin
    implements InAppProductSuccess {
  _$InAppProductSuccess({required this.product});

  @override
  final PurchasableProduct product;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InAppProductResult.success(product: $product)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InAppProductResult.success'))
      ..add(DiagnosticsProperty('product', product));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppProductSuccess &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$$InAppProductSuccessCopyWith<_$InAppProductSuccess> get copyWith =>
      __$$InAppProductSuccessCopyWithImpl<_$InAppProductSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchasableProduct product) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return success(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PurchasableProduct product)? success,
    TResult Function(String errorMsg)? failure,
  }) {
    return success?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchasableProduct product)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InAppProductSuccess value) success,
    required TResult Function(InAppProductFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InAppProductSuccess value)? success,
    TResult Function(InAppProductFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InAppProductSuccess value)? success,
    TResult Function(InAppProductFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class InAppProductSuccess implements InAppProductResult {
  factory InAppProductSuccess({required final PurchasableProduct product}) =
      _$InAppProductSuccess;

  PurchasableProduct get product => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InAppProductSuccessCopyWith<_$InAppProductSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InAppProductFailureCopyWith<$Res> {
  factory _$$InAppProductFailureCopyWith(_$InAppProductFailure value,
          $Res Function(_$InAppProductFailure) then) =
      __$$InAppProductFailureCopyWithImpl<$Res>;
  $Res call({String errorMsg});
}

/// @nodoc
class __$$InAppProductFailureCopyWithImpl<$Res>
    extends _$InAppProductResultCopyWithImpl<$Res>
    implements _$$InAppProductFailureCopyWith<$Res> {
  __$$InAppProductFailureCopyWithImpl(
      _$InAppProductFailure _value, $Res Function(_$InAppProductFailure) _then)
      : super(_value, (v) => _then(v as _$InAppProductFailure));

  @override
  _$InAppProductFailure get _value => super._value as _$InAppProductFailure;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$InAppProductFailure(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InAppProductFailure
    with DiagnosticableTreeMixin
    implements InAppProductFailure {
  _$InAppProductFailure({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InAppProductResult.failure(errorMsg: $errorMsg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InAppProductResult.failure'))
      ..add(DiagnosticsProperty('errorMsg', errorMsg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InAppProductFailure &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$InAppProductFailureCopyWith<_$InAppProductFailure> get copyWith =>
      __$$InAppProductFailureCopyWithImpl<_$InAppProductFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchasableProduct product) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return failure(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PurchasableProduct product)? success,
    TResult Function(String errorMsg)? failure,
  }) {
    return failure?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchasableProduct product)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InAppProductSuccess value) success,
    required TResult Function(InAppProductFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InAppProductSuccess value)? success,
    TResult Function(InAppProductFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InAppProductSuccess value)? success,
    TResult Function(InAppProductFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class InAppProductFailure implements InAppProductResult {
  factory InAppProductFailure({required final String errorMsg}) =
      _$InAppProductFailure;

  String get errorMsg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InAppProductFailureCopyWith<_$InAppProductFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
