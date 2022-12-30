// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AvailableProductsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<StoreProduct> products) success,
    required TResult Function(String errorMsg) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<StoreProduct> products)? success,
    TResult? Function(String errorMsg)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<StoreProduct> products)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AvailableProductsSuccess value) success,
    required TResult Function(AvailableProductsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvailableProductsSuccess value)? success,
    TResult? Function(AvailableProductsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvailableProductsSuccess value)? success,
    TResult Function(AvailableProductsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableProductsResultCopyWith<$Res> {
  factory $AvailableProductsResultCopyWith(AvailableProductsResult value,
          $Res Function(AvailableProductsResult) then) =
      _$AvailableProductsResultCopyWithImpl<$Res, AvailableProductsResult>;
}

/// @nodoc
class _$AvailableProductsResultCopyWithImpl<$Res,
        $Val extends AvailableProductsResult>
    implements $AvailableProductsResultCopyWith<$Res> {
  _$AvailableProductsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AvailableProductsSuccessCopyWith<$Res> {
  factory _$$AvailableProductsSuccessCopyWith(_$AvailableProductsSuccess value,
          $Res Function(_$AvailableProductsSuccess) then) =
      __$$AvailableProductsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<StoreProduct> products});
}

/// @nodoc
class __$$AvailableProductsSuccessCopyWithImpl<$Res>
    extends _$AvailableProductsResultCopyWithImpl<$Res,
        _$AvailableProductsSuccess>
    implements _$$AvailableProductsSuccessCopyWith<$Res> {
  __$$AvailableProductsSuccessCopyWithImpl(_$AvailableProductsSuccess _value,
      $Res Function(_$AvailableProductsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$AvailableProductsSuccess(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as KtList<StoreProduct>,
    ));
  }
}

/// @nodoc

class _$AvailableProductsSuccess implements AvailableProductsSuccess {
  _$AvailableProductsSuccess({required this.products});

  @override
  final KtList<StoreProduct> products;

  @override
  String toString() {
    return 'AvailableProductsResult.success(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableProductsSuccess &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableProductsSuccessCopyWith<_$AvailableProductsSuccess>
      get copyWith =>
          __$$AvailableProductsSuccessCopyWithImpl<_$AvailableProductsSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<StoreProduct> products) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return success(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<StoreProduct> products)? success,
    TResult? Function(String errorMsg)? failure,
  }) {
    return success?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<StoreProduct> products)? success,
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
    required TResult Function(AvailableProductsSuccess value) success,
    required TResult Function(AvailableProductsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvailableProductsSuccess value)? success,
    TResult? Function(AvailableProductsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvailableProductsSuccess value)? success,
    TResult Function(AvailableProductsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AvailableProductsSuccess implements AvailableProductsResult {
  factory AvailableProductsSuccess(
          {required final KtList<StoreProduct> products}) =
      _$AvailableProductsSuccess;

  KtList<StoreProduct> get products;
  @JsonKey(ignore: true)
  _$$AvailableProductsSuccessCopyWith<_$AvailableProductsSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AvailableProductsFailureCopyWith<$Res> {
  factory _$$AvailableProductsFailureCopyWith(_$AvailableProductsFailure value,
          $Res Function(_$AvailableProductsFailure) then) =
      __$$AvailableProductsFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg});
}

/// @nodoc
class __$$AvailableProductsFailureCopyWithImpl<$Res>
    extends _$AvailableProductsResultCopyWithImpl<$Res,
        _$AvailableProductsFailure>
    implements _$$AvailableProductsFailureCopyWith<$Res> {
  __$$AvailableProductsFailureCopyWithImpl(_$AvailableProductsFailure _value,
      $Res Function(_$AvailableProductsFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
  }) {
    return _then(_$AvailableProductsFailure(
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AvailableProductsFailure implements AvailableProductsFailure {
  _$AvailableProductsFailure({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'AvailableProductsResult.failure(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableProductsFailure &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableProductsFailureCopyWith<_$AvailableProductsFailure>
      get copyWith =>
          __$$AvailableProductsFailureCopyWithImpl<_$AvailableProductsFailure>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<StoreProduct> products) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return failure(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<StoreProduct> products)? success,
    TResult? Function(String errorMsg)? failure,
  }) {
    return failure?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<StoreProduct> products)? success,
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
    required TResult Function(AvailableProductsSuccess value) success,
    required TResult Function(AvailableProductsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvailableProductsSuccess value)? success,
    TResult? Function(AvailableProductsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvailableProductsSuccess value)? success,
    TResult Function(AvailableProductsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AvailableProductsFailure implements AvailableProductsResult {
  factory AvailableProductsFailure({required final String errorMsg}) =
      _$AvailableProductsFailure;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$AvailableProductsFailureCopyWith<_$AvailableProductsFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreProduct product) success,
    required TResult Function(String errorMsg) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreProduct product)? success,
    TResult? Function(String errorMsg)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreProduct product)? success,
    TResult Function(String errorMsg)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductSuccess value) success,
    required TResult Function(ProductFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductSuccess value)? success,
    TResult? Function(ProductFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductSuccess value)? success,
    TResult Function(ProductFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResultCopyWith<$Res> {
  factory $ProductResultCopyWith(
          ProductResult value, $Res Function(ProductResult) then) =
      _$ProductResultCopyWithImpl<$Res, ProductResult>;
}

/// @nodoc
class _$ProductResultCopyWithImpl<$Res, $Val extends ProductResult>
    implements $ProductResultCopyWith<$Res> {
  _$ProductResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductSuccessCopyWith<$Res> {
  factory _$$ProductSuccessCopyWith(
          _$ProductSuccess value, $Res Function(_$ProductSuccess) then) =
      __$$ProductSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreProduct product});

  $StoreProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductSuccessCopyWithImpl<$Res>
    extends _$ProductResultCopyWithImpl<$Res, _$ProductSuccess>
    implements _$$ProductSuccessCopyWith<$Res> {
  __$$ProductSuccessCopyWithImpl(
      _$ProductSuccess _value, $Res Function(_$ProductSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$ProductSuccess(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as StoreProduct,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreProductCopyWith<$Res> get product {
    return $StoreProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$ProductSuccess implements ProductSuccess {
  _$ProductSuccess({required this.product});

  @override
  final StoreProduct product;

  @override
  String toString() {
    return 'ProductResult.success(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSuccess &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSuccessCopyWith<_$ProductSuccess> get copyWith =>
      __$$ProductSuccessCopyWithImpl<_$ProductSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreProduct product) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return success(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreProduct product)? success,
    TResult? Function(String errorMsg)? failure,
  }) {
    return success?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreProduct product)? success,
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
    required TResult Function(ProductSuccess value) success,
    required TResult Function(ProductFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductSuccess value)? success,
    TResult? Function(ProductFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductSuccess value)? success,
    TResult Function(ProductFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProductSuccess implements ProductResult {
  factory ProductSuccess({required final StoreProduct product}) =
      _$ProductSuccess;

  StoreProduct get product;
  @JsonKey(ignore: true)
  _$$ProductSuccessCopyWith<_$ProductSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductFailureCopyWith<$Res> {
  factory _$$ProductFailureCopyWith(
          _$ProductFailure value, $Res Function(_$ProductFailure) then) =
      __$$ProductFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg});
}

/// @nodoc
class __$$ProductFailureCopyWithImpl<$Res>
    extends _$ProductResultCopyWithImpl<$Res, _$ProductFailure>
    implements _$$ProductFailureCopyWith<$Res> {
  __$$ProductFailureCopyWithImpl(
      _$ProductFailure _value, $Res Function(_$ProductFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
  }) {
    return _then(_$ProductFailure(
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductFailure implements ProductFailure {
  _$ProductFailure({required this.errorMsg});

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'ProductResult.failure(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFailure &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFailureCopyWith<_$ProductFailure> get copyWith =>
      __$$ProductFailureCopyWithImpl<_$ProductFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StoreProduct product) success,
    required TResult Function(String errorMsg) failure,
  }) {
    return failure(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StoreProduct product)? success,
    TResult? Function(String errorMsg)? failure,
  }) {
    return failure?.call(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StoreProduct product)? success,
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
    required TResult Function(ProductSuccess value) success,
    required TResult Function(ProductFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductSuccess value)? success,
    TResult? Function(ProductFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductSuccess value)? success,
    TResult Function(ProductFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ProductFailure implements ProductResult {
  factory ProductFailure({required final String errorMsg}) = _$ProductFailure;

  String get errorMsg;
  @JsonKey(ignore: true)
  _$$ProductFailureCopyWith<_$ProductFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
