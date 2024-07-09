// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'what_is_it.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WhatIsItModel _$WhatIsItModelFromJson(Map<String, dynamic> json) {
  return _WhatIsItModel.fromJson(json);
}

/// @nodoc
mixin _$WhatIsItModel {
  String get id => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get backgroundColor => throw _privateConstructorUsedError;
  @EdgeInsetsConverter()
  EdgeInsets get backgroundPadding => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get terminalBgColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get titleColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get titleBgColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get contentColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get contentBgColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get separatorColor => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get buttonRed => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get buttonYellow => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get buttonGreen => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get brandColor => throw _privateConstructorUsedError;
  String get topicIcon => throw _privateConstructorUsedError;
  String get topicName => throw _privateConstructorUsedError;
  String get contentText => throw _privateConstructorUsedError;
  bool get posted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhatIsItModelCopyWith<WhatIsItModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhatIsItModelCopyWith<$Res> {
  factory $WhatIsItModelCopyWith(
          WhatIsItModel value, $Res Function(WhatIsItModel) then) =
      _$WhatIsItModelCopyWithImpl<$Res, WhatIsItModel>;
  @useResult
  $Res call(
      {String id,
      @ColorConverter() Color backgroundColor,
      @EdgeInsetsConverter() EdgeInsets backgroundPadding,
      @ColorConverter() Color terminalBgColor,
      @ColorConverter() Color titleColor,
      @ColorConverter() Color titleBgColor,
      @ColorConverter() Color contentColor,
      @ColorConverter() Color contentBgColor,
      @ColorConverter() Color separatorColor,
      @ColorConverter() Color buttonRed,
      @ColorConverter() Color buttonYellow,
      @ColorConverter() Color buttonGreen,
      @ColorConverter() Color brandColor,
      String topicIcon,
      String topicName,
      String contentText,
      bool posted});
}

/// @nodoc
class _$WhatIsItModelCopyWithImpl<$Res, $Val extends WhatIsItModel>
    implements $WhatIsItModelCopyWith<$Res> {
  _$WhatIsItModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backgroundColor = null,
    Object? backgroundPadding = null,
    Object? terminalBgColor = null,
    Object? titleColor = null,
    Object? titleBgColor = null,
    Object? contentColor = null,
    Object? contentBgColor = null,
    Object? separatorColor = null,
    Object? buttonRed = null,
    Object? buttonYellow = null,
    Object? buttonGreen = null,
    Object? brandColor = null,
    Object? topicIcon = null,
    Object? topicName = null,
    Object? contentText = null,
    Object? posted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundPadding: null == backgroundPadding
          ? _value.backgroundPadding
          : backgroundPadding // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
      terminalBgColor: null == terminalBgColor
          ? _value.terminalBgColor
          : terminalBgColor // ignore: cast_nullable_to_non_nullable
              as Color,
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      titleBgColor: null == titleBgColor
          ? _value.titleBgColor
          : titleBgColor // ignore: cast_nullable_to_non_nullable
              as Color,
      contentColor: null == contentColor
          ? _value.contentColor
          : contentColor // ignore: cast_nullable_to_non_nullable
              as Color,
      contentBgColor: null == contentBgColor
          ? _value.contentBgColor
          : contentBgColor // ignore: cast_nullable_to_non_nullable
              as Color,
      separatorColor: null == separatorColor
          ? _value.separatorColor
          : separatorColor // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonRed: null == buttonRed
          ? _value.buttonRed
          : buttonRed // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonYellow: null == buttonYellow
          ? _value.buttonYellow
          : buttonYellow // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonGreen: null == buttonGreen
          ? _value.buttonGreen
          : buttonGreen // ignore: cast_nullable_to_non_nullable
              as Color,
      brandColor: null == brandColor
          ? _value.brandColor
          : brandColor // ignore: cast_nullable_to_non_nullable
              as Color,
      topicIcon: null == topicIcon
          ? _value.topicIcon
          : topicIcon // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      contentText: null == contentText
          ? _value.contentText
          : contentText // ignore: cast_nullable_to_non_nullable
              as String,
      posted: null == posted
          ? _value.posted
          : posted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WhatIsItModelImplCopyWith<$Res>
    implements $WhatIsItModelCopyWith<$Res> {
  factory _$$WhatIsItModelImplCopyWith(
          _$WhatIsItModelImpl value, $Res Function(_$WhatIsItModelImpl) then) =
      __$$WhatIsItModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @ColorConverter() Color backgroundColor,
      @EdgeInsetsConverter() EdgeInsets backgroundPadding,
      @ColorConverter() Color terminalBgColor,
      @ColorConverter() Color titleColor,
      @ColorConverter() Color titleBgColor,
      @ColorConverter() Color contentColor,
      @ColorConverter() Color contentBgColor,
      @ColorConverter() Color separatorColor,
      @ColorConverter() Color buttonRed,
      @ColorConverter() Color buttonYellow,
      @ColorConverter() Color buttonGreen,
      @ColorConverter() Color brandColor,
      String topicIcon,
      String topicName,
      String contentText,
      bool posted});
}

/// @nodoc
class __$$WhatIsItModelImplCopyWithImpl<$Res>
    extends _$WhatIsItModelCopyWithImpl<$Res, _$WhatIsItModelImpl>
    implements _$$WhatIsItModelImplCopyWith<$Res> {
  __$$WhatIsItModelImplCopyWithImpl(
      _$WhatIsItModelImpl _value, $Res Function(_$WhatIsItModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backgroundColor = null,
    Object? backgroundPadding = null,
    Object? terminalBgColor = null,
    Object? titleColor = null,
    Object? titleBgColor = null,
    Object? contentColor = null,
    Object? contentBgColor = null,
    Object? separatorColor = null,
    Object? buttonRed = null,
    Object? buttonYellow = null,
    Object? buttonGreen = null,
    Object? brandColor = null,
    Object? topicIcon = null,
    Object? topicName = null,
    Object? contentText = null,
    Object? posted = null,
  }) {
    return _then(_$WhatIsItModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundPadding: null == backgroundPadding
          ? _value.backgroundPadding
          : backgroundPadding // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
      terminalBgColor: null == terminalBgColor
          ? _value.terminalBgColor
          : terminalBgColor // ignore: cast_nullable_to_non_nullable
              as Color,
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as Color,
      titleBgColor: null == titleBgColor
          ? _value.titleBgColor
          : titleBgColor // ignore: cast_nullable_to_non_nullable
              as Color,
      contentColor: null == contentColor
          ? _value.contentColor
          : contentColor // ignore: cast_nullable_to_non_nullable
              as Color,
      contentBgColor: null == contentBgColor
          ? _value.contentBgColor
          : contentBgColor // ignore: cast_nullable_to_non_nullable
              as Color,
      separatorColor: null == separatorColor
          ? _value.separatorColor
          : separatorColor // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonRed: null == buttonRed
          ? _value.buttonRed
          : buttonRed // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonYellow: null == buttonYellow
          ? _value.buttonYellow
          : buttonYellow // ignore: cast_nullable_to_non_nullable
              as Color,
      buttonGreen: null == buttonGreen
          ? _value.buttonGreen
          : buttonGreen // ignore: cast_nullable_to_non_nullable
              as Color,
      brandColor: null == brandColor
          ? _value.brandColor
          : brandColor // ignore: cast_nullable_to_non_nullable
              as Color,
      topicIcon: null == topicIcon
          ? _value.topicIcon
          : topicIcon // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      contentText: null == contentText
          ? _value.contentText
          : contentText // ignore: cast_nullable_to_non_nullable
              as String,
      posted: null == posted
          ? _value.posted
          : posted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WhatIsItModelImpl implements _WhatIsItModel {
  _$WhatIsItModelImpl(
      {required this.id,
      @ColorConverter() required this.backgroundColor,
      @EdgeInsetsConverter() required this.backgroundPadding,
      @ColorConverter() required this.terminalBgColor,
      @ColorConverter() required this.titleColor,
      @ColorConverter() required this.titleBgColor,
      @ColorConverter() required this.contentColor,
      @ColorConverter() required this.contentBgColor,
      @ColorConverter() required this.separatorColor,
      @ColorConverter() required this.buttonRed,
      @ColorConverter() required this.buttonYellow,
      @ColorConverter() required this.buttonGreen,
      @ColorConverter() required this.brandColor,
      required this.topicIcon,
      required this.topicName,
      required this.contentText,
      required this.posted});

  factory _$WhatIsItModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhatIsItModelImplFromJson(json);

  @override
  final String id;
  @override
  @ColorConverter()
  final Color backgroundColor;
  @override
  @EdgeInsetsConverter()
  final EdgeInsets backgroundPadding;
  @override
  @ColorConverter()
  final Color terminalBgColor;
  @override
  @ColorConverter()
  final Color titleColor;
  @override
  @ColorConverter()
  final Color titleBgColor;
  @override
  @ColorConverter()
  final Color contentColor;
  @override
  @ColorConverter()
  final Color contentBgColor;
  @override
  @ColorConverter()
  final Color separatorColor;
  @override
  @ColorConverter()
  final Color buttonRed;
  @override
  @ColorConverter()
  final Color buttonYellow;
  @override
  @ColorConverter()
  final Color buttonGreen;
  @override
  @ColorConverter()
  final Color brandColor;
  @override
  final String topicIcon;
  @override
  final String topicName;
  @override
  final String contentText;
  @override
  final bool posted;

  @override
  String toString() {
    return 'WhatIsItModel(id: $id, backgroundColor: $backgroundColor, backgroundPadding: $backgroundPadding, terminalBgColor: $terminalBgColor, titleColor: $titleColor, titleBgColor: $titleBgColor, contentColor: $contentColor, contentBgColor: $contentBgColor, separatorColor: $separatorColor, buttonRed: $buttonRed, buttonYellow: $buttonYellow, buttonGreen: $buttonGreen, brandColor: $brandColor, topicIcon: $topicIcon, topicName: $topicName, contentText: $contentText, posted: $posted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhatIsItModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.backgroundPadding, backgroundPadding) ||
                other.backgroundPadding == backgroundPadding) &&
            (identical(other.terminalBgColor, terminalBgColor) ||
                other.terminalBgColor == terminalBgColor) &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.titleBgColor, titleBgColor) ||
                other.titleBgColor == titleBgColor) &&
            (identical(other.contentColor, contentColor) ||
                other.contentColor == contentColor) &&
            (identical(other.contentBgColor, contentBgColor) ||
                other.contentBgColor == contentBgColor) &&
            (identical(other.separatorColor, separatorColor) ||
                other.separatorColor == separatorColor) &&
            (identical(other.buttonRed, buttonRed) ||
                other.buttonRed == buttonRed) &&
            (identical(other.buttonYellow, buttonYellow) ||
                other.buttonYellow == buttonYellow) &&
            (identical(other.buttonGreen, buttonGreen) ||
                other.buttonGreen == buttonGreen) &&
            (identical(other.brandColor, brandColor) ||
                other.brandColor == brandColor) &&
            (identical(other.topicIcon, topicIcon) ||
                other.topicIcon == topicIcon) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.contentText, contentText) ||
                other.contentText == contentText) &&
            (identical(other.posted, posted) || other.posted == posted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      backgroundColor,
      backgroundPadding,
      terminalBgColor,
      titleColor,
      titleBgColor,
      contentColor,
      contentBgColor,
      separatorColor,
      buttonRed,
      buttonYellow,
      buttonGreen,
      brandColor,
      topicIcon,
      topicName,
      contentText,
      posted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WhatIsItModelImplCopyWith<_$WhatIsItModelImpl> get copyWith =>
      __$$WhatIsItModelImplCopyWithImpl<_$WhatIsItModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WhatIsItModelImplToJson(
      this,
    );
  }
}

abstract class _WhatIsItModel implements WhatIsItModel {
  factory _WhatIsItModel(
      {required final String id,
      @ColorConverter() required final Color backgroundColor,
      @EdgeInsetsConverter() required final EdgeInsets backgroundPadding,
      @ColorConverter() required final Color terminalBgColor,
      @ColorConverter() required final Color titleColor,
      @ColorConverter() required final Color titleBgColor,
      @ColorConverter() required final Color contentColor,
      @ColorConverter() required final Color contentBgColor,
      @ColorConverter() required final Color separatorColor,
      @ColorConverter() required final Color buttonRed,
      @ColorConverter() required final Color buttonYellow,
      @ColorConverter() required final Color buttonGreen,
      @ColorConverter() required final Color brandColor,
      required final String topicIcon,
      required final String topicName,
      required final String contentText,
      required final bool posted}) = _$WhatIsItModelImpl;

  factory _WhatIsItModel.fromJson(Map<String, dynamic> json) =
      _$WhatIsItModelImpl.fromJson;

  @override
  String get id;
  @override
  @ColorConverter()
  Color get backgroundColor;
  @override
  @EdgeInsetsConverter()
  EdgeInsets get backgroundPadding;
  @override
  @ColorConverter()
  Color get terminalBgColor;
  @override
  @ColorConverter()
  Color get titleColor;
  @override
  @ColorConverter()
  Color get titleBgColor;
  @override
  @ColorConverter()
  Color get contentColor;
  @override
  @ColorConverter()
  Color get contentBgColor;
  @override
  @ColorConverter()
  Color get separatorColor;
  @override
  @ColorConverter()
  Color get buttonRed;
  @override
  @ColorConverter()
  Color get buttonYellow;
  @override
  @ColorConverter()
  Color get buttonGreen;
  @override
  @ColorConverter()
  Color get brandColor;
  @override
  String get topicIcon;
  @override
  String get topicName;
  @override
  String get contentText;
  @override
  bool get posted;
  @override
  @JsonKey(ignore: true)
  _$$WhatIsItModelImplCopyWith<_$WhatIsItModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
