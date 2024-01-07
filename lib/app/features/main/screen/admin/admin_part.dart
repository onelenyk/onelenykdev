import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/features/main/data/admin/admin_cubit.dart";
import "package:onelenykco/app/features/main/data/admin/admin_state.dart";
import "package:onelenykco/app/features/main/screen/admin/selected_topic_edit_widget.dart";
import "package:timeago/timeago.dart" as timeago;

class AdminPart extends StatelessWidget {
  AdminPart({super.key});

  final getIt = GetIt.instance;

  late final AdminCubit cubit = getIt.get<AdminCubit>();

  Widget topicPostItem(final String text) => Wrap(
      children: [
        InfoBlock(
          child: TextFormField(
            controller: TextEditingController(text: text),
            style: GoogleFonts.robotoMono(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
          ),
        ),
      ],
    );

  Widget buildSelectedTopicEdit(final AdminState state) {
    final selectedTopic = state.selectedTopic;
    final content = selectedTopic?.content;

    if (selectedTopic == null || content == null) {
      return const InfoBlock(child: Text("Empty topic"));
    }

    return SelectedTopicEditWidget(
      selectedTopic: selectedTopic,
      key: ValueKey(selectedTopic.id),
      onSaveClicked: (final updatedItem) {
        cubit.updateTopic(updatedItem);
      },
    );
  }

  Widget buildAllTopicList(final AdminState state) => Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          child: InfoBlock(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Index Title",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            color: Colors.lightBlue.shade200, fontSize: 12,),
                      ),
                      const SizedBox(
                        width: 48,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 400,
          child: InfoBlock(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.sortedTopics.length,
              itemBuilder: (final context, final index) {
                final item = state.sortedTopics[index];

                final date = timeago.format(item.date ?? DateTime.now());
                return HoverButton(
                  color: item.id == state.selectedTopic?.id
                      ? Colors.yellow.shade200.withAlpha(78)
                      : Colors.black,
                  onTap: () {
                    cubit.selectTopic(item);
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$index ${item.content?.title}",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              color: Colors.lightBlue.shade200, fontSize: 16,),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (final context, final index) => const SizedBox(height: 8),
            ),
          ),
        ),
        const SizedBox(
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
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "delete",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent.shade200,
                              fontSize: 16,),
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
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "add new",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow.shade200,
                              fontSize: 16,),
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

  Widget buildBody(final AdminState state) => Center(
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
                const SizedBox(
                  width: 16,
                ),
                buildSelectedTopicEdit(state),
              ],
            ),
          ),
        ),
      ),
    );

  @override
  Widget build(final BuildContext context) => BlocConsumer<AdminCubit, AdminState>(
      bloc: cubit, // Provide the cubit
      builder: (final context, final state) => buildBody(state),
      listener: (final context, final state) {},
    );
}