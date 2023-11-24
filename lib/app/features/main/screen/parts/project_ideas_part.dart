import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsIdeasPart extends StatelessWidget {
  const ProjectsIdeasPart({super.key});

  Widget topicPostItem(String text, VoidCallback onTap) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    final List<String> items = ["test","test2","test3",
      "test3","test4","test45"];
    return SizedBox(
      width: 400,
      height: 400,
      child: GridView.builder(
        // Define the grid delegate
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 items per row
          crossAxisSpacing: 4.0, // Horizontal space between items
          mainAxisSpacing: 4.0, // Vertical space between items
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];

          return Column(
            children: [
              Text(item),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildBody(context),
    );
  }
}
