// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'what_is_it.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WhatIsItModelImpl _$$WhatIsItModelImplFromJson(Map<String, dynamic> json) =>
    _$WhatIsItModelImpl(
      id: json['id'] as String,
      backgroundColor: const ColorConverter()
          .fromJson((json['backgroundColor'] as num).toInt()),
      backgroundPadding: const EdgeInsetsConverter()
          .fromJson(json['backgroundPadding'] as String),
      terminalBgColor: const ColorConverter()
          .fromJson((json['terminalBgColor'] as num).toInt()),
      titleColor:
          const ColorConverter().fromJson((json['titleColor'] as num).toInt()),
      titleBgColor: const ColorConverter()
          .fromJson((json['titleBgColor'] as num).toInt()),
      contentColor: const ColorConverter()
          .fromJson((json['contentColor'] as num).toInt()),
      contentBgColor: const ColorConverter()
          .fromJson((json['contentBgColor'] as num).toInt()),
      separatorColor: const ColorConverter()
          .fromJson((json['separatorColor'] as num).toInt()),
      buttonRed:
          const ColorConverter().fromJson((json['buttonRed'] as num).toInt()),
      buttonYellow: const ColorConverter()
          .fromJson((json['buttonYellow'] as num).toInt()),
      buttonGreen:
          const ColorConverter().fromJson((json['buttonGreen'] as num).toInt()),
      brandColor:
          const ColorConverter().fromJson((json['brandColor'] as num).toInt()),
      topicIcon: json['topicIcon'] as String,
      topicName: json['topicName'] as String,
      contentText: json['contentText'] as String,
    );

Map<String, dynamic> _$$WhatIsItModelImplToJson(_$WhatIsItModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backgroundColor':
          const ColorConverter().toJson(instance.backgroundColor),
      'backgroundPadding':
          const EdgeInsetsConverter().toJson(instance.backgroundPadding),
      'terminalBgColor':
          const ColorConverter().toJson(instance.terminalBgColor),
      'titleColor': const ColorConverter().toJson(instance.titleColor),
      'titleBgColor': const ColorConverter().toJson(instance.titleBgColor),
      'contentColor': const ColorConverter().toJson(instance.contentColor),
      'contentBgColor': const ColorConverter().toJson(instance.contentBgColor),
      'separatorColor': const ColorConverter().toJson(instance.separatorColor),
      'buttonRed': const ColorConverter().toJson(instance.buttonRed),
      'buttonYellow': const ColorConverter().toJson(instance.buttonYellow),
      'buttonGreen': const ColorConverter().toJson(instance.buttonGreen),
      'brandColor': const ColorConverter().toJson(instance.brandColor),
      'topicIcon': instance.topicIcon,
      'topicName': instance.topicName,
      'contentText': instance.contentText,
    };
