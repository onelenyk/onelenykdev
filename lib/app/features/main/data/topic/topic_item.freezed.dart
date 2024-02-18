// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopicItem _$TopicItemFromJson(Map<String, dynamic> json) {
  return _TopicItem.fromJson(json);
}

/// @nodoc
mixin _$TopicItem {
  String? get id => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get date => throw _privateConstructorUsedError;
  TopicContent? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicItemCopyWith<TopicItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicItemCopyWith<$Res> {
  factory $TopicItemCopyWith(TopicItem value, $Res Function(TopicItem) then) =
      _$TopicItemCopyWithImpl<$Res, TopicItem>;
  @useResult
  $Res call(
      {String? id,
      @TimestampSerializer() DateTime? date,
      TopicContent? content});

  $TopicContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$TopicItemCopyWithImpl<$Res, $Val extends TopicItem>
    implements $TopicItemCopyWith<$Res> {
  _$TopicItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as TopicContent?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TopicContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $TopicContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TopicItemImplCopyWith<$Res>
    implements $TopicItemCopyWith<$Res> {
  factory _$$TopicItemImplCopyWith(
          _$TopicItemImpl value, $Res Function(_$TopicItemImpl) then) =
      __$$TopicItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @TimestampSerializer() DateTime? date,
      TopicContent? content});

  @override
  $TopicContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$TopicItemImplCopyWithImpl<$Res>
    extends _$TopicItemCopyWithImpl<$Res, _$TopicItemImpl>
    implements _$$TopicItemImplCopyWith<$Res> {
  __$$TopicItemImplCopyWithImpl(
      _$TopicItemImpl _value, $Res Function(_$TopicItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? content = freezed,
  }) {
    return _then(_$TopicItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as TopicContent?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicItemImpl extends _TopicItem {
  _$TopicItemImpl(
      {required this.id,
      @TimestampSerializer() required this.date,
      required this.content})
      : super._();

  factory _$TopicItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicItemImplFromJson(json);

  @override
  final String? id;
  @override
  @TimestampSerializer()
  final DateTime? date;
  @override
  final TopicContent? content;

  @override
  String toString() {
    return 'TopicItem(id: $id, date: $date, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicItemImplCopyWith<_$TopicItemImpl> get copyWith =>
      __$$TopicItemImplCopyWithImpl<_$TopicItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicItemImplToJson(
      this,
    );
  }
}

abstract class _TopicItem extends TopicItem {
  factory _TopicItem(
      {required final String? id,
      @TimestampSerializer() required final DateTime? date,
      required final TopicContent? content}) = _$TopicItemImpl;
  _TopicItem._() : super._();

  factory _TopicItem.fromJson(Map<String, dynamic> json) =
      _$TopicItemImpl.fromJson;

  @override
  String? get id;
  @override
  @TimestampSerializer()
  DateTime? get date;
  @override
  TopicContent? get content;
  @override
  @JsonKey(ignore: true)
  _$$TopicItemImplCopyWith<_$TopicItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
