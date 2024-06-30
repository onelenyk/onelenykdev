import "dart:ui";

import "package:flutter/material.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/tg_channel.dart";


class WhatIsItModel {
  final String id;
  final Color backgroundColor;
  final EdgeInsets backgroundPadding;
  final Color terminalBgColor;
  final Color titleColor;
  final Color titleBgColor;
  final Color contentColor;
  final Color contentBgColor;
  final Color separatorColor;
  final Color buttonRed;
  final Color buttonYellow;
  final Color buttonGreen;
  final Color brandColor;
  final String topicIcon;
  final String topicName;
  final String contentText;

  WhatIsItModel({
    required this.id,
    required this.backgroundColor,
    required this.backgroundPadding,
    required this.terminalBgColor,
    required this.titleColor,
    required this.titleBgColor,
    required this.contentBgColor,
    required this.contentColor,
    required this.separatorColor,
    required this.buttonRed,
    required this.buttonYellow,
    required this.buttonGreen,
    required this.brandColor,
    required this.topicIcon,
    required this.topicName,
    required this.contentText,
  });

  WhatIsItModel copyWith({
    String? id,
    Color? backgroundColor,
    EdgeInsets? backgroundPadding,
    Color? terminalBgColor,
    Color? titleColor,
    Color? titleBgColor,
    Color? contentColor,
    Color? contentBgColor,
    Color? separatorColor,
    Color? buttonRed,
    Color? buttonYellow,
    Color? buttonGreen,
    Color? brandColor,
    String? topicIcon,
    String? topicName,
    String? contentText,
  }) =>
      WhatIsItModel(
        id: id ?? this.id,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        backgroundPadding: backgroundPadding ?? this.backgroundPadding,
        terminalBgColor: terminalBgColor ?? this.terminalBgColor,
        titleColor: titleColor ?? this.titleColor,
        titleBgColor: titleBgColor ?? this.titleBgColor,
        contentColor: contentColor ?? this.contentColor,
        contentBgColor: contentBgColor ?? this.contentBgColor,
        separatorColor: separatorColor ?? this.separatorColor,
        buttonRed: buttonRed ?? this.buttonRed,
        buttonYellow: buttonYellow ?? this.buttonYellow,
        buttonGreen: buttonGreen ?? this.buttonGreen,
        brandColor: brandColor ?? this.brandColor,
        topicIcon: topicIcon ?? this.topicIcon,
        topicName: topicName ?? this.topicName,
        contentText: contentText ?? this.contentText,
      );
}
final WhatIsItModel gradlepost1 = WhatIsItModel(
  id: "1",
  backgroundColor: Colors.transparent,

  backgroundPadding: EdgeInsets.zero,
  // White background color
  terminalBgColor: const Color(0xFF000000),
  // Black terminal background
  titleBgColor: const Color(0xB3C6C6C6),
  // Black title background
  titleColor: const Color(0xFFFFFFFF),
  // White title text
  separatorColor: const Color(0xFF444444),
  // Gray separator
  contentBgColor: Colors.transparent,
  contentColor: Colors.white,
  buttonRed: const Color(0xFFFF5F56),
  buttonYellow: const Color(0xFFFFBD2E),
  buttonGreen: const Color(0xFF27C93F),
  brandColor: const Color(0xFF000000),
  // Black brand color
  topicIcon:
      'https://gradle.com/wp-content/themes/fuel/assets/img/branding/gradle-elephant-icon-dark-green.svg',
  topicName: 'Gradle',
  contentText:
      """Automating the building of software projects is one thing that Gradle does.
      \nIt ensures all components (source code, libraries, resources) are properly integrated by compiling code, running tests, and packaging applications, resulting in a ready-to-run build. Think of it as a recipe manager for software development.""",
);

final WhatIsItModel gradlepost2 = WhatIsItModel(
    id: "2",
    backgroundColor: Colors.transparent,
    backgroundPadding: EdgeInsets.zero,

    // White background color
    terminalBgColor: const Color(0xFF000000), // Black terminal background
    titleBgColor: const Color(0xB3C6C6C6),
    // Black title background
    titleColor: const Color(0xFFFFFFFF),
    // White title text
    separatorColor: const Color(0xFF444444),
    // Gray separator
    contentBgColor: Colors.transparent,
    contentColor: Colors.white,
    buttonRed: const Color(0xFFFF5F56),
    buttonYellow: const Color(0xFFFFBD2E),
    buttonGreen: const Color(0xFF27C93F),
    brandColor: const Color(0xFF000000),
    // Black brand color
    topicIcon:
        'https://gradle.com/wp-content/themes/fuel/assets/img/branding/gradle-elephant-icon-dark-green.svg',
    topicName: 'Files in a Project',
    contentText: """Gradle projects use a few key files:

- **build.gradle.kts**: Defines build setup, dependencies, and plugins.
- **settings.gradle.kts**: Manages multi-project builds and modules.
- **gradle.properties**: Sets project properties like Java version.

These files help manage your project's build process efficiently.""");


final WhatIsItModel gradlepost3 = WhatIsItModel(
    id: "3",
    backgroundColor: Colors.transparent,
    // White background color
    terminalBgColor: const Color(0xFF000000),

    backgroundPadding: EdgeInsets.zero,
    // Black terminal background
    titleBgColor: const Color(0xB3C6C6C6),
    // Black title background
    titleColor: const Color(0xFFFFFFFF),
    // White title text
    separatorColor: const Color(0xFF444444),
    // Gray separator
    contentBgColor: Colors.transparent,
    contentColor: Colors.white,
    buttonRed: const Color(0xFFFF5F56),
    buttonYellow: const Color(0xFFFFBD2E),
    buttonGreen: const Color(0xFF27C93F),
    brandColor: const Color(0xFF000000),
    // Black brand color
    topicIcon:
    'https://gradle.com/wp-content/themes/fuel/assets/img/branding/gradle-elephant-icon-dark-green.svg',
    topicName: 'Gradle Init Command',
    contentText: """
The command `./gradlew init --type kotlin-application --dsl kotlin --package com.example.sample --project-name sample` starts a new Gradle project:

- `--type kotlin-application`: Sets up a Kotlin app.
- `--dsl kotlin`: Uses Kotlin DSL.
- `--package com.example.sample --project-name sample`: Defines the package and project name.
""");
