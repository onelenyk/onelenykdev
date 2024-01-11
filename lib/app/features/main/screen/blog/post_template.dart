import "package:onelenykco/app/features/main/screen/blog/blog_page.dart";

final Note template = Note(note: """
# Flutter Markdown Syntax Showcase

Welcome to the Flutter Markdown Syntax Showcase! In this post, we'll explore different Markdown syntax elements supported by the `flutter_markdown` library.

## Text Formatting

This is a **bold** and *italic* text.

## Lists

- Item 1
- Item 2
  1. Subitem A
  2. Subitem B

## Links

[Visit Google](https://www.google.com)

## Images

![Flutter Logo](https://docs.flutter.dev/assets/images/shared/brand/flutter/logo+text/horizontal/default.png)

## Code Blocks

```dart
void main() {
  print("Hello, Flutter!");
}
```

## Tables

| Name  | Age | Location |
|-------|-----|----------|
| Alice | 25  | New York  |
| Bob   | 30  | San Francisco |

## Blockquotes

> This is a blockquote.

## Custom Color Syntax

[#ff26ed26](This text is in green color).

## Heading with Custom Color

Feel free to use this post as a reference for your Flutter Markdown projects. Experiment with different syntax elements and enjoy crafting rich and well-formatted content!
""", id: "sample", date: DateTime.now());
