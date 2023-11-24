import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/info_block.dart';
import '../../data/topic/topic_content.dart';

class TopicPart extends StatelessWidget {
  final TopicContent content;

  TopicPart({super.key, required this.content});

  Widget topicPostItem(String text, VoidCallback onTap) {
    return Wrap(
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
    return Container(
      width: 400,
      child: Column(
        children: [
          InfoBlock(
            child: Row(
              children: [
                Text(
                  content.title ?? "",
                  style: GoogleFonts.robotoMono(
                      fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: content.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = content.data[index];
              onTap() {
                //  cubit.selectTopic(topic: item);
              }
              return InfoBlock(
                  child: topicPostItem(item.text ?? "",onTap));
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }
}
