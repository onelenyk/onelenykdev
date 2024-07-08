import "package:flutter/cupertino.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'what_is_it.freezed.dart';
part 'what_is_it.g.dart';

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}

class EdgeInsetsConverter implements JsonConverter<EdgeInsets, String> {
  const EdgeInsetsConverter();

  @override
  EdgeInsets fromJson(String json) {
    final parts = json.split(',');
    return EdgeInsets.only(
      left: double.parse(parts[0]),
      top: double.parse(parts[1]),
      right: double.parse(parts[2]),
      bottom: double.parse(parts[3]),
    );
  }

  @override
  String toJson(EdgeInsets edgeInsets) {
    return '${edgeInsets.left},${edgeInsets.top},${edgeInsets.right},${edgeInsets.bottom}';
  }
}

@freezed
class WhatIsItModel with _$WhatIsItModel {
  factory WhatIsItModel({
    required String id,
    @ColorConverter() required Color backgroundColor,
    @EdgeInsetsConverter() required EdgeInsets backgroundPadding,
    @ColorConverter() required Color terminalBgColor,
    @ColorConverter() required Color titleColor,
    @ColorConverter() required Color titleBgColor,
    @ColorConverter() required Color contentColor,
    @ColorConverter() required Color contentBgColor,
    @ColorConverter() required Color separatorColor,
    @ColorConverter() required Color buttonRed,
    @ColorConverter() required Color buttonYellow,
    @ColorConverter() required Color buttonGreen,
    @ColorConverter() required Color brandColor,
    required String topicIcon,
    required String topicName,
    required String contentText,
  }) = _WhatIsItModel;

  factory WhatIsItModel.defaultValues({
    required String id,
  }) {
    return WhatIsItModel(
      id: id,
      backgroundColor: const Color(0xFFFFFFFF),
      backgroundPadding: const EdgeInsets.all(0),
      terminalBgColor: const Color(0xFF000000),
      titleColor: const Color(0xFF000000),
      titleBgColor: const Color(0xFFFFFFFF),
      contentColor: const Color(0xFF000000),
      contentBgColor: const Color(0xFFFFFFFF),
      separatorColor: const Color(0xFFCCCCCC),
      buttonRed: const Color(0xFFFF0000),
      buttonYellow: const Color(0xFFFFFF00),
      buttonGreen: const Color(0xFF00FF00),
      brandColor: const Color(0xFF0000FF),
      topicIcon: '',
      topicName: '',
      contentText: '',
    );
  }

  factory WhatIsItModel.fromJson(Map<String, dynamic> json) =>
      _$WhatIsItModelFromJson(json);
}