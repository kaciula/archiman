// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_search_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleSearchSuggestion {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleSearchSuggestionCopyWith<GoogleSearchSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSearchSuggestionCopyWith<$Res> {
  factory $GoogleSearchSuggestionCopyWith(GoogleSearchSuggestion value,
          $Res Function(GoogleSearchSuggestion) then) =
      _$GoogleSearchSuggestionCopyWithImpl<$Res, GoogleSearchSuggestion>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$GoogleSearchSuggestionCopyWithImpl<$Res,
        $Val extends GoogleSearchSuggestion>
    implements $GoogleSearchSuggestionCopyWith<$Res> {
  _$GoogleSearchSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleSearchSuggestionCopyWith<$Res>
    implements $GoogleSearchSuggestionCopyWith<$Res> {
  factory _$$_GoogleSearchSuggestionCopyWith(_$_GoogleSearchSuggestion value,
          $Res Function(_$_GoogleSearchSuggestion) then) =
      __$$_GoogleSearchSuggestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_GoogleSearchSuggestionCopyWithImpl<$Res>
    extends _$GoogleSearchSuggestionCopyWithImpl<$Res,
        _$_GoogleSearchSuggestion>
    implements _$$_GoogleSearchSuggestionCopyWith<$Res> {
  __$$_GoogleSearchSuggestionCopyWithImpl(_$_GoogleSearchSuggestion _value,
      $Res Function(_$_GoogleSearchSuggestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_GoogleSearchSuggestion(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoogleSearchSuggestion implements _GoogleSearchSuggestion {
  _$_GoogleSearchSuggestion({required this.id, required this.name});

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'GoogleSearchSuggestion(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleSearchSuggestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleSearchSuggestionCopyWith<_$_GoogleSearchSuggestion> get copyWith =>
      __$$_GoogleSearchSuggestionCopyWithImpl<_$_GoogleSearchSuggestion>(
          this, _$identity);
}

abstract class _GoogleSearchSuggestion implements GoogleSearchSuggestion {
  factory _GoogleSearchSuggestion(
      {required final String id,
      required final String name}) = _$_GoogleSearchSuggestion;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleSearchSuggestionCopyWith<_$_GoogleSearchSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}
