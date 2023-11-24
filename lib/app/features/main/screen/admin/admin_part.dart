import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/features/main/screen/admin/selected_topic_edit_widget.dart';

import 'dart:math' as math;

import 'package:timeago/timeago.dart' as timeago;

import '../../../../common/hover_button.dart';
import '../../../../common/info_block.dart';
import '../../data/admin/admin_cubit.dart';
import '../../data/admin/admin_state.dart';

class AdminPart extends StatelessWidget {
  AdminPart({super.key});

  final getIt = GetIt.instance;

  late final AdminCubit cubit = getIt.get<AdminCubit>();

  Widget topicPostItem(String text) {
    return Wrap(
      children: [
        InfoBlock(
          child: TextFormField(
            controller: TextEditingController(text: text),
            style: GoogleFonts.robotoMono(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildSelectedTopicEdit(AdminState state) {
    var selectedTopic = state.selectedTopic;
    var content = selectedTopic?.content;

    if (selectedTopic == null || content == null) {
      return InfoBlock(child: Text("Empty topic"));
    }

    return SelectedTopicEditWidget(
      selectedTopic: selectedTopic,
      key: ValueKey(selectedTopic.id),
      onSaveClicked: (updatedItem) {
        cubit.updateTopic(updatedItem);
      },
    );
  }

  Widget buildAllTopicList(AdminState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: InfoBlock(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Index Title",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            color: Colors.lightBlue.shade200, fontSize: 12),
                      ),
                      SizedBox(
                        width: 48,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 400,
          child: InfoBlock(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.sortedTopics.length,
              itemBuilder: (context, index) {
                var item = state.sortedTopics[index];

                var date = timeago.format(item.date ?? DateTime.now());
                return HoverButton(
                  color: item.id == state.selectedTopic?.id
                      ? Colors.yellow.shade200.withAlpha(78)
                      : Colors.black,
                  onTap: () {
                    cubit.selectTopic(item);
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$index ${item.content?.title}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "${date}",
                          style: TextStyle(
                              color: Colors.lightBlue.shade200, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 400,
          child: InfoBlock(
            child: Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    HoverButton(
                      onTap: () {
                        cubit.deleteSelectedTopic();
                      },
                      onDoubleTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "delete",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent.shade200,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    HoverButton(
                      onTap: () {
                        cubit.createEmptyTopic();
                      },
                      onDoubleTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "add new",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow.shade200,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBody(AdminState state) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAllTopicList(state),
                SizedBox(
                  width: 16,
                ),
                buildSelectedTopicEdit(state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      bloc: cubit, // Provide the cubit
      builder: (context, state) {
        return buildBody(state);
      },
      listener: (BuildContext context, AdminState state) {},
    );
  }
}