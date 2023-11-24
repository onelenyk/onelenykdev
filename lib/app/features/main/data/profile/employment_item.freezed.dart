// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employment_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExperienceItem _$ExperienceItemFromJson(Map<String, dynamic> json) {
  return _ExperienceItem.fromJson(json);
}

/// @nodoc
mixin _$ExperienceItem {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampSerializerNullable()
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<String> get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperienceItemCopyWith<ExperienceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceItemCopyWith<$Res> {
  factory $ExperienceItemCopyWith(
          ExperienceItem value, $Res Function(ExperienceItem) then) =
      _$ExperienceItemCopyWithImpl<$Res, ExperienceItem>;
  @useResult
  $Res call(
      {String name,
      String id,
      String role,
      @TimestampSerializer() DateTime startDate,
      @TimestampSerializerNullable() DateTime? endDate,
      List<String> description});
}

/// @nodoc
class _$ExperienceItemCopyWithImpl<$Res, $Val extends ExperienceItem>
    implements $ExperienceItemCopyWith<$Res> {
  _$ExperienceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperienceItemImplCopyWith<$Res>
    implements $ExperienceItemCopyWith<$Res> {
  factory _$$ExperienceItemImplCopyWith(_$ExperienceItemImpl value,
          $Res Function(_$ExperienceItemImpl) then) =
      __$$ExperienceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      String role,
      @TimestampSerializer() DateTime startDate,
      @TimestampSerializerNullable() DateTime? endDate,
      List<String> description});
}

/// @nodoc
class __$$ExperienceItemImplCopyWithImpl<$Res>
    extends _$ExperienceItemCopyWithImpl<$Res, _$ExperienceItemImpl>
    implements _$$ExperienceItemImplCopyWith<$Res> {
  __$$ExperienceItemImplCopyWithImpl(
      _$ExperienceItemImpl _value, $Res Function(_$ExperienceItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? role = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? description = null,
  }) {
    return _then(_$ExperienceItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      description: null == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceItemImpl extends _ExperienceItem {
  _$ExperienceItemImpl(
      {required this.name,
      required this.id,
      required this.role,
      @TimestampSerializer() required this.startDate,
      @TimestampSerializerNullable() required this.endDate,
      required final List<String> description})
      : _description = description,
        super._();

  factory _$ExperienceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceItemImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final String role;
  @override
  @TimestampSerializer()
  final DateTime startDate;
  @override
  @TimestampSerializerNullable()
  final DateTime? endDate;
  final List<String> _description;
  @override
  List<String> get description {
    if (_description is EqualUnmodifiableListView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_description);
  }

  @override
  String toString() {
    return 'ExperienceItem(name: $name, id: $id, role: $role, startDate: $startDate, endDate: $endDate, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._description, _description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, role, startDate,
      endDate, const DeepCollectionEquality().hash(_description));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceItemImplCopyWith<_$ExperienceItemImpl> get copyWith =>
      __$$ExperienceItemImplCopyWithImpl<_$ExperienceItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceItemImplToJson(
      this,
    );
  }
}

abstract class _ExperienceItem extends ExperienceItem {
  factory _ExperienceItem(
      {required final String name,
      required final String id,
      required final String role,
      @TimestampSerializer() required final DateTime startDate,
      @TimestampSerializerNullable() required final DateTime? endDate,
      required final List<String> description}) = _$ExperienceItemImpl;
  _ExperienceItem._() : super._();

  factory _ExperienceItem.fromJson(Map<String, dynamic> json) =
      _$ExperienceItemImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  String get role;
  @override
  @TimestampSerializer()
  DateTime get startDate;
  @override
  @TimestampSerializerNullable()
  DateTime? get endDate;
  @override
  List<String> get description;
  @override
  @JsonKey(ignore: true)
  _$$ExperienceItemImplCopyWith<_$ExperienceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
