// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyPasswordsState {
  List<PasswordItem> get passwords => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPasswordsStateCopyWith<MyPasswordsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPasswordsStateCopyWith<$Res> {
  factory $MyPasswordsStateCopyWith(
          MyPasswordsState value, $Res Function(MyPasswordsState) then) =
      _$MyPasswordsStateCopyWithImpl<$Res, MyPasswordsState>;
  @useResult
  $Res call({List<PasswordItem> passwords, String searchQuery});
}

/// @nodoc
class _$MyPasswordsStateCopyWithImpl<$Res, $Val extends MyPasswordsState>
    implements $MyPasswordsStateCopyWith<$Res> {
  _$MyPasswordsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwords = null,
    Object? searchQuery = null,
  }) {
    return _then(_value.copyWith(
      passwords: null == passwords
          ? _value.passwords
          : passwords // ignore: cast_nullable_to_non_nullable
              as List<PasswordItem>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyPasswordsStateImplCopyWith<$Res>
    implements $MyPasswordsStateCopyWith<$Res> {
  factory _$$MyPasswordsStateImplCopyWith(_$MyPasswordsStateImpl value,
          $Res Function(_$MyPasswordsStateImpl) then) =
      __$$MyPasswordsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PasswordItem> passwords, String searchQuery});
}

/// @nodoc
class __$$MyPasswordsStateImplCopyWithImpl<$Res>
    extends _$MyPasswordsStateCopyWithImpl<$Res, _$MyPasswordsStateImpl>
    implements _$$MyPasswordsStateImplCopyWith<$Res> {
  __$$MyPasswordsStateImplCopyWithImpl(_$MyPasswordsStateImpl _value,
      $Res Function(_$MyPasswordsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passwords = null,
    Object? searchQuery = null,
  }) {
    return _then(_$MyPasswordsStateImpl(
      passwords: null == passwords
          ? _value._passwords
          : passwords // ignore: cast_nullable_to_non_nullable
              as List<PasswordItem>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyPasswordsStateImpl extends _MyPasswordsState {
  _$MyPasswordsStateImpl(
      {required final List<PasswordItem> passwords, required this.searchQuery})
      : _passwords = passwords,
        super._();

  final List<PasswordItem> _passwords;
  @override
  List<PasswordItem> get passwords {
    if (_passwords is EqualUnmodifiableListView) return _passwords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passwords);
  }

  @override
  final String searchQuery;

  @override
  String toString() {
    return 'MyPasswordsState(passwords: $passwords, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyPasswordsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._passwords, _passwords) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_passwords), searchQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyPasswordsStateImplCopyWith<_$MyPasswordsStateImpl> get copyWith =>
      __$$MyPasswordsStateImplCopyWithImpl<_$MyPasswordsStateImpl>(
          this, _$identity);
}

abstract class _MyPasswordsState extends MyPasswordsState {
  factory _MyPasswordsState(
      {required final List<PasswordItem> passwords,
      required final String searchQuery}) = _$MyPasswordsStateImpl;
  _MyPasswordsState._() : super._();

  @override
  List<PasswordItem> get passwords;
  @override
  String get searchQuery;
  @override
  @JsonKey(ignore: true)
  _$$MyPasswordsStateImplCopyWith<_$MyPasswordsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
