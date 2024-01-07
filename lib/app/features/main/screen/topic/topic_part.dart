import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../../common/info_block.dart";
import "../../data/topic/topic_content.dart";

class TopicPart extends StatelessWidget {

  const TopicPart({required this.content, super.key});
  final TopicContent content;

  Widget topicPostItem(final String text, final VoidCallback onTap) => Wrap(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
        ),
      ],
    );

  Widget buildBody(final BuildContext context) => SizedBox(
      width: 400,
      child: Column(
        children: [
          InfoBlock(
            child: Row(
              children: [
                Text(
                  content.title ?? "",
                  style: GoogleFonts.robotoMono(
                      fontSize: 20, color: Colors.white,),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            itemCount: content.data.length,
            shrinkWrap: true,
            itemBuilder: (final context, final index) {
              final item = content.data[index];
              onTap() {
                //  cubit.selectTopic(topic: item);
              }
              return InfoBlock(
                  child: topicPostItem(item.text ?? "",onTap),);
            },
            separatorBuilder: (final context, final index) => const SizedBox(height: 8),
          ),
        ],
      ),
    );

  @override
  Widget build(final BuildContext context) => Center(
      child: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
}
