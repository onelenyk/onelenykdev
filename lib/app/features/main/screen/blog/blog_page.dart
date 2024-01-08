import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

@RoutePage()
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

