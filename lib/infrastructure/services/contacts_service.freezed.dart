// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contacts_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceContact {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get initials => throw _privateConstructorUsedError;
  Uint8List? get photo =>
      throw _privateConstructorUsedError; // Phone numbers can be in various formats so they need to be normalized/cleaned down the line
  KtList<String> get phoneNums => throw _privateConstructorUsedError;
  KtList<String> get emailAddresses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceContactCopyWith<DeviceContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceContactCopyWith<$Res> {
  factory $DeviceContactCopyWith(
          DeviceContact value, $Res Function(DeviceContact) then) =
      _$DeviceContactCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String displayName,
      String initials,
      Uint8List? photo,
      KtList<String> phoneNums,
      KtList<String> emailAddresses});
}

/// @nodoc
class _$DeviceContactCopyWithImpl<$Res>
    implements $DeviceContactCopyWith<$Res> {
  _$DeviceContactCopyWithImpl(this._value, this._then);

  final DeviceContact _value;
  // ignore: unused_field
  final $Res Function(DeviceContact) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? initials = freezed,
    Object? photo = freezed,
    Object? phoneNums = freezed,
    Object? emailAddresses = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      initials: initials == freezed
          ? _value.initials
          : initials // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      phoneNums: phoneNums == freezed
          ? _value.phoneNums
          : phoneNums // ignore: cast_nullable_to_non_nullable
              as KtList<String>,
      emailAddresses: emailAddresses == freezed
          ? _value.emailAddresses
          : emailAddresses // ignore: cast_nullable_to_non_nullable
              as KtList<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceContactCopyWith<$Res>
    implements $DeviceContactCopyWith<$Res> {
  factory _$$_DeviceContactCopyWith(
          _$_DeviceContact value, $Res Function(_$_DeviceContact) then) =
      __$$_DeviceContactCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String displayName,
      String initials,
      Uint8List? photo,
      KtList<String> phoneNums,
      KtList<String> emailAddresses});
}

/// @nodoc
class __$$_DeviceContactCopyWithImpl<$Res>
    extends _$DeviceContactCopyWithImpl<$Res>
    implements _$$_DeviceContactCopyWith<$Res> {
  __$$_DeviceContactCopyWithImpl(
      _$_DeviceContact _value, $Res Function(_$_DeviceContact) _then)
      : super(_value, (v) => _then(v as _$_DeviceContact));

  @override
  _$_DeviceContact get _value => super._value as _$_DeviceContact;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? initials = freezed,
    Object? photo = freezed,
    Object? phoneNums = freezed,
    Object? emailAddresses = freezed,
  }) {
    return _then(_$_DeviceContact(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      initials: initials == freezed
          ? _value.initials
          : initials // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      phoneNums: phoneNums == freezed
          ? _value.phoneNums
          : phoneNums // ignore: cast_nullable_to_non_nullable
              as KtList<String>,
      emailAddresses: emailAddresses == freezed
          ? _value.emailAddresses
          : emailAddresses // ignore: cast_nullable_to_non_nullable
              as KtList<String>,
    ));
  }
}

/// @nodoc

class _$_DeviceContact implements _DeviceContact {
  _$_DeviceContact(
      {required this.id,
      required this.displayName,
      required this.initials,
      required this.photo,
      required this.phoneNums,
      required this.emailAddresses});

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String initials;
  @override
  final Uint8List? photo;
// Phone numbers can be in various formats so they need to be normalized/cleaned down the line
  @override
  final KtList<String> phoneNums;
  @override
  final KtList<String> emailAddresses;

  @override
  String toString() {
    return 'DeviceContact(id: $id, displayName: $displayName, initials: $initials, photo: $photo, phoneNums: $phoneNums, emailAddresses: $emailAddresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceContact &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.initials, initials) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality().equals(other.phoneNums, phoneNums) &&
            const DeepCollectionEquality()
                .equals(other.emailAddresses, emailAddresses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(initials),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(phoneNums),
      const DeepCollectionEquality().hash(emailAddresses));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceContactCopyWith<_$_DeviceContact> get copyWith =>
      __$$_DeviceContactCopyWithImpl<_$_DeviceContact>(this, _$identity);
}

abstract class _DeviceContact implements DeviceContact {
  factory _DeviceContact(
      {required final String id,
      required final String displayName,
      required final String initials,
      required final Uint8List? photo,
      required final KtList<String> phoneNums,
      required final KtList<String> emailAddresses}) = _$_DeviceContact;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get displayName => throw _privateConstructorUsedError;
  @override
  String get initials => throw _privateConstructorUsedError;
  @override
  Uint8List? get photo => throw _privateConstructorUsedError;
  @override // Phone numbers can be in various formats so they need to be normalized/cleaned down the line
  KtList<String> get phoneNums => throw _privateConstructorUsedError;
  @override
  KtList<String> get emailAddresses => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceContactCopyWith<_$_DeviceContact> get copyWith =>
      throw _privateConstructorUsedError;
}
