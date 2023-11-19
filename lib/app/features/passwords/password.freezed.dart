// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasswordItem _$PasswordItemFromJson(Map<String, dynamic> json) {
  return _PasswordItem.fromJson(json);
}

/// @nodoc
mixin _$PasswordItem {
  String get id => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordItemCopyWith<PasswordItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordItemCopyWith<$Res> {
  factory $PasswordItemCopyWith(
          PasswordItem value, $Res Function(PasswordItem) then) =
      _$PasswordItemCopyWithImpl<$Res, PasswordItem>;
  @useResult
  $Res call({String id, String service, String password, String login});
}

/// @nodoc
class _$PasswordItemCopyWithImpl<$Res, $Val extends PasswordItem>
    implements $PasswordItemCopyWith<$Res> {
  _$PasswordItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? service = null,
    Object? password = null,
    Object? login = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordItemImplCopyWith<$Res>
    implements $PasswordItemCopyWith<$Res> {
  factory _$$PasswordItemImplCopyWith(
          _$PasswordItemImpl value, $Res Function(_$PasswordItemImpl) then) =
      __$$PasswordItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String service, String password, String login});
}

/// @nodoc
class __$$PasswordItemImplCopyWithImpl<$Res>
    extends _$PasswordItemCopyWithImpl<$Res, _$PasswordItemImpl>
    implements _$$PasswordItemImplCopyWith<$Res> {
  __$$PasswordItemImplCopyWithImpl(
      _$PasswordItemImpl _value, $Res Function(_$PasswordItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? service = null,
    Object? password = null,
    Object? login = null,
  }) {
    return _then(_$PasswordItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordItemImpl extends _PasswordItem {
  _$PasswordItemImpl(
      {required this.id,
      required this.service,
      required this.password,
      required this.login})
      : super._();

  factory _$PasswordItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordItemImplFromJson(json);

  @override
  final String id;
  @override
  final String service;
  @override
  final String password;
  @override
  final String login;

  @override
  String toString() {
    return 'PasswordItem(id: $id, service: $service, password: $password, login: $login)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.login, login) || other.login == login));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, service, password, login);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordItemImplCopyWith<_$PasswordItemImpl> get copyWith =>
      __$$PasswordItemImplCopyWithImpl<_$PasswordItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordItemImplToJson(
      this,
    );
  }
}

abstract class _PasswordItem extends PasswordItem {
  factory _PasswordItem(
      {required final String id,
      required final String service,
      required final String password,
      required final String login}) = _$PasswordItemImpl;
  _PasswordItem._() : super._();

  factory _PasswordItem.fromJson(Map<String, dynamic> json) =
      _$PasswordItemImpl.fromJson;

  @override
  String get id;
  @override
  String get service;
  @override
  String get password;
  @override
  String get login;
  @override
  @JsonKey(ignore: true)
  _$$PasswordItemImplCopyWith<_$PasswordItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
