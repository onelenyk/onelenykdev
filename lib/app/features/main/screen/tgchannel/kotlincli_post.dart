import "dart:ui";

import "package:flutter/material.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/tg_channel.dart";
import "package:onelenykdev/app/features/main/screen/tgchannel/what_is_it.dart";

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
  posted: true,

  contentColor: Colors.white,
  buttonRed: const Color(0xFFFF5F56),
  buttonYellow: const Color(0xFFFFBD2E),
  buttonGreen: const Color(0xFF27C93F),
  brandColor: const Color(0xFF3C72D3),
  // Black brand color
  topicIcon:
      'https://upload.wikimedia.org/wikipedia/commons/0/06/Kotlin_Icon.svg',
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
  brandColor: const Color(0xFF3C72D3),
  // Black brand color
  posted: true,
  topicIcon:
      'https://upload.wikimedia.org/wikipedia/commons/0/06/Kotlin_Icon.svg',
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

  posted: true,

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
  brandColor: const Color(0xFF3C72D3),
  // Black brand color
  topicIcon:
      'https://upload.wikimedia.org/wikipedia/commons/0/06/Kotlin_Icon.svg',
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

final WhatIsItModel kotlinclipost4 = WhatIsItModel(
  id: "6",
  backgroundColor: Colors.transparent,

  posted: false,

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
  brandColor: const Color(0xFF3C72D3),
  // Black brand color
  topicIcon:
      'https://upload.wikimedia.org/wikipedia/commons/0/06/Kotlin_Icon.svg',
  topicName: 'Kotlin CLI:main',
  contentText: r"""
The `main` method sets up and runs the CLI command by initializing `CommandLine` with the `*App` class and executing it with the provided arguments:

```kotlin
fun main(args: Array<String>) {
    val exitCode = CommandLine(App()).execute(*args)
    System.exit(exitCode)
}
```
###### *App - previously creted
""",
);
