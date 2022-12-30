// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchaseInfo {
  PurchaseDetails get storeDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseInfoCopyWith<PurchaseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseInfoCopyWith<$Res> {
  factory $PurchaseInfoCopyWith(
          PurchaseInfo value, $Res Function(PurchaseInfo) then) =
      _$PurchaseInfoCopyWithImpl<$Res, PurchaseInfo>;
  @useResult
  $Res call({PurchaseDetails storeDetails});
}

/// @nodoc
class _$PurchaseInfoCopyWithImpl<$Res, $Val extends PurchaseInfo>
    implements $PurchaseInfoCopyWith<$Res> {
  _$PurchaseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeDetails = null,
  }) {
    return _then(_value.copyWith(
      storeDetails: null == storeDetails
          ? _value.storeDetails
          : storeDetails // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchaseInfoCopyWith<$Res>
    implements $PurchaseInfoCopyWith<$Res> {
  factory _$$_PurchaseInfoCopyWith(
          _$_PurchaseInfo value, $Res Function(_$_PurchaseInfo) then) =
      __$$_PurchaseInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseDetails storeDetails});
}

/// @nodoc
class __$$_PurchaseInfoCopyWithImpl<$Res>
    extends _$PurchaseInfoCopyWithImpl<$Res, _$_PurchaseInfo>
    implements _$$_PurchaseInfoCopyWith<$Res> {
  __$$_PurchaseInfoCopyWithImpl(
      _$_PurchaseInfo _value, $Res Function(_$_PurchaseInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeDetails = null,
  }) {
    return _then(_$_PurchaseInfo(
      storeDetails: null == storeDetails
          ? _value.storeDetails
          : storeDetails // ignore: cast_nullable_to_non_nullable
              as PurchaseDetails,
    ));
  }
}

/// @nodoc

class _$_PurchaseInfo extends _PurchaseInfo {
  _$_PurchaseInfo({required this.storeDetails}) : super._();

  @override
  final PurchaseDetails storeDetails;

  @override
  String toString() {
    return 'PurchaseInfo(storeDetails: $storeDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseInfo &&
            (identical(other.storeDetails, storeDetails) ||
                other.storeDetails == storeDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseInfoCopyWith<_$_PurchaseInfo> get copyWith =>
      __$$_PurchaseInfoCopyWithImpl<_$_PurchaseInfo>(this, _$identity);
}

abstract class _PurchaseInfo extends PurchaseInfo {
  factory _PurchaseInfo({required final PurchaseDetails storeDetails}) =
      _$_PurchaseInfo;
  _PurchaseInfo._() : super._();

  @override
  PurchaseDetails get storeDetails;
  @override
  @JsonKey(ignore: true)
  _$$_PurchaseInfoCopyWith<_$_PurchaseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
