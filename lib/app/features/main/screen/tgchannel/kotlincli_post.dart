import "dart:ui";

import "package:flutter/material.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/tg_channel.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/what_is_it.dart";

import "gradle_post.dart";

final WhatIsItModel kotlinclipost1 = WhatIsItModel(
  id: "4",
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
  topicName: 'Kotlin CLI:general',
  contentText: r"""
##### `CommandLine.Command` is used to define a command for the CLI tool. An explanation:
```kotlin
@CommandLine.Command (
  name = "...", // The name of the CLI tool
  mixinStandardHelpOptions = true, // Enable defaults
  version = ["..."], // The version of the tool
  description = ["..."] // Brief description
)
class App : Callable<Int> { }
""",
);


final WhatIsItModel kotlinclipost2 = WhatIsItModel(
  id: "5",
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
  topicName: 'Kotlin CLI:options',
  contentText: r"""
##### `CommandLine.Option` is used to define a command-line option for the CLI tool. Here's an explanation:

```kotlin
@CommandLine.Option(
    names = ["-o", "--option"], // Option name
    description = ["..."], // Description for help message
    required = true // Indicates this option is mandatory
)
lateinit var option: String
```
""",
);


final WhatIsItModel kotlinclipost3 = WhatIsItModel(
  id: "6",
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
  topicName: 'Kotlin CLI:business',
  contentText: r"""
##### The `call` function is the entry point of the CLI tool's logic. It runs when the CLI command is invoked:
```kotlin
class App : Callable<Int> {
    override fun call(): Int {
        return 0 // Indicates successful execution
}}
```
##### The `call` body handles CLI options and executes the main functionality
""",
);
