// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopicDataItem _$TopicDataItemFromJson(Map<String, dynamic> json) {
  return _TopicDataItem.fromJson(json);
}

/// @nodoc
mixin _$TopicDataItem {
  int get date => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicDataItemCopyWith<TopicDataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicDataItemCopyWith<$Res> {
  factory $TopicDataItemCopyWith(
          TopicDataItem value, $Res Function(TopicDataItem) then) =
      _$TopicDataItemCopyWithImpl<$Res, TopicDataItem>;
  @useResult
  $Res call({int date, String text});
}

/// @nodoc
class _$TopicDataItemCopyWithImpl<$Res, $Val extends TopicDataItem>
    implements $TopicDataItemCopyWith<$Res> {
  _$TopicDataItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicDataItemImplCopyWith<$Res>
    implements $TopicDataItemCopyWith<$Res> {
  factory _$$TopicDataItemImplCopyWith(
          _$TopicDataItemImpl value, $Res Function(_$TopicDataItemImpl) then) =
      __$$TopicDataItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int date, String text});
}

/// @nodoc
class __$$TopicDataItemImplCopyWithImpl<$Res>
    extends _$TopicDataItemCopyWithImpl<$Res, _$TopicDataItemImpl>
    implements _$$TopicDataItemImplCopyWith<$Res> {
  __$$TopicDataItemImplCopyWithImpl(
      _$TopicDataItemImpl _value, $Res Function(_$TopicDataItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? text = null,
  }) {
    return _then(_$TopicDataItemImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicDataItemImpl implements _TopicDataItem {
  _$TopicDataItemImpl({required this.date, required this.text});

  factory _$TopicDataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicDataItemImplFromJson(json);

  @override
  final int date;
  @override
  final String text;

  @override
  String toString() {
    return 'TopicDataItem(date: $date, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicDataItemImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicDataItemImplCopyWith<_$TopicDataItemImpl> get copyWith =>
      __$$TopicDataItemImplCopyWithImpl<_$TopicDataItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicDataItemImplToJson(
      this,
    );
  }
}

abstract class _TopicDataItem implements TopicDataItem {
  factory _TopicDataItem(
      {required final int date,
      required final String text}) = _$TopicDataItemImpl;

  factory _TopicDataItem.fromJson(Map<String, dynamic> json) =
      _$TopicDataItemImpl.fromJson;

  @override
  int get date;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$TopicDataItemImplCopyWith<_$TopicDataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopicContent _$TopicContentFromJson(Map<String, dynamic> json) {
  return _TopicContent.fromJson(json);
}

/// @nodoc
mixin _$TopicContent {
  String? get title => throw _privateConstructorUsedError;
  List<TopicDataItem> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicContentCopyWith<TopicContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicContentCopyWith<$Res> {
  factory $TopicContentCopyWith(
          TopicContent value, $Res Function(TopicContent) then) =
      _$TopicContentCopyWithImpl<$Res, TopicContent>;
  @useResult
  $Res call({String? title, List<TopicDataItem> data});
}

/// @nodoc
class _$TopicContentCopyWithImpl<$Res, $Val extends TopicContent>
    implements $TopicContentCopyWith<$Res> {
  _$TopicContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TopicDataItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicContentImplCopyWith<$Res>
    implements $TopicContentCopyWith<$Res> {
  factory _$$TopicContentImplCopyWith(
          _$TopicContentImpl value, $Res Function(_$TopicContentImpl) then) =
      __$$TopicContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, List<TopicDataItem> data});
}

/// @nodoc
class __$$TopicContentImplCopyWithImpl<$Res>
    extends _$TopicContentCopyWithImpl<$Res, _$TopicContentImpl>
    implements _$$TopicContentImplCopyWith<$Res> {
  __$$TopicContentImplCopyWithImpl(
      _$TopicContentImpl _value, $Res Function(_$TopicContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? data = null,
  }) {
    return _then(_$TopicContentImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TopicDataItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicContentImpl extends _TopicContent {
  _$TopicContentImpl(
      {required this.title, required final List<TopicDataItem> data})
      : _data = data,
        super._();

  factory _$TopicContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicContentImplFromJson(json);

  @override
  final String? title;
  final List<TopicDataItem> _data;
  @override
  List<TopicDataItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TopicContent(title: $title, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicContentImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicContentImplCopyWith<_$TopicContentImpl> get copyWith =>
      __$$TopicContentImplCopyWithImpl<_$TopicContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicContentImplToJson(
      this,
    );
  }
}

abstract class _TopicContent extends TopicContent {
  factory _TopicContent(
      {required final String? title,
      required final List<TopicDataItem> data}) = _$TopicContentImpl;
  _TopicContent._() : super._();

  factory _TopicContent.fromJson(Map<String, dynamic> json) =
      _$TopicContentImpl.fromJson;

  @override
  String? get title;
  @override
  List<TopicDataItem> get data;
  @override
  @JsonKey(ignore: true)
  _$$TopicContentImplCopyWith<_$TopicContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
