// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EducationItem _$EducationItemFromJson(Map<String, dynamic> json) {
  return _EducationItem.fromJson(json);
}

/// @nodoc
mixin _$EducationItem {
  String get universityName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampSerializerNullable()
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationItemCopyWith<EducationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationItemCopyWith<$Res> {
  factory $EducationItemCopyWith(
          EducationItem value, $Res Function(EducationItem) then) =
      _$EducationItemCopyWithImpl<$Res, EducationItem>;
  @useResult
  $Res call(
      {String universityName,
      String role,
      @TimestampSerializer() DateTime startDate,
      @TimestampSerializerNullable() DateTime? endDate});
}

/// @nodoc
class _$EducationItemCopyWithImpl<$Res, $Val extends EducationItem>
    implements $EducationItemCopyWith<$Res> {
  _$EducationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? universityName = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      universityName: null == universityName
          ? _value.universityName
          : universityName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationItemImplCopyWith<$Res>
    implements $EducationItemCopyWith<$Res> {
  factory _$$EducationItemImplCopyWith(
          _$EducationItemImpl value, $Res Function(_$EducationItemImpl) then) =
      __$$EducationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String universityName,
      String role,
      @TimestampSerializer() DateTime startDate,
      @TimestampSerializerNullable() DateTime? endDate});
}

/// @nodoc
class __$$EducationItemImplCopyWithImpl<$Res>
    extends _$EducationItemCopyWithImpl<$Res, _$EducationItemImpl>
    implements _$$EducationItemImplCopyWith<$Res> {
  __$$EducationItemImplCopyWithImpl(
      _$EducationItemImpl _value, $Res Function(_$EducationItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? universityName = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_$EducationItemImpl(
      universityName: null == universityName
          ? _value.universityName
          : universityName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationItemImpl extends _EducationItem {
  _$EducationItemImpl(
      {required this.universityName,
      required this.role,
      @TimestampSerializer() required this.startDate,
      @TimestampSerializerNullable() required this.endDate})
      : super._();

  factory _$EducationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationItemImplFromJson(json);

  @override
  final String universityName;
  @override
  final String role;
  @override
  @TimestampSerializer()
  final DateTime startDate;
  @override
  @TimestampSerializerNullable()
  final DateTime? endDate;

  @override
  String toString() {
    return 'EducationItem(universityName: $universityName, role: $role, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationItemImpl &&
            (identical(other.universityName, universityName) ||
                other.universityName == universityName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, universityName, role, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationItemImplCopyWith<_$EducationItemImpl> get copyWith =>
      __$$EducationItemImplCopyWithImpl<_$EducationItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationItemImplToJson(
      this,
    );
  }
}

abstract class _EducationItem extends EducationItem {
  factory _EducationItem(
          {required final String universityName,
          required final String role,
          @TimestampSerializer() required final DateTime startDate,
          @TimestampSerializerNullable() required final DateTime? endDate}) =
      _$EducationItemImpl;
  _EducationItem._() : super._();

  factory _EducationItem.fromJson(Map<String, dynamic> json) =
      _$EducationItemImpl.fromJson;

  @override
  String get universityName;
  @override
  String get role;
  @override
  @TimestampSerializer()
  DateTime get startDate;
  @override
  @TimestampSerializerNullable()
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$EducationItemImplCopyWith<_$EducationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
