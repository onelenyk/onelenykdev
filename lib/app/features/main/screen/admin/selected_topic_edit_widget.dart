import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/hover_button.dart';
import '../../../../common/info_block.dart';
import '../../data/admin/admin_cubit.dart';
import '../../data/topic/topic_content.dart';
import '../../data/topic/topic_item.dart';
import 'admin_part.dart';

// Define the StatefulWidget
class SelectedTopicEditWidget extends StatefulWidget {
  final TopicItem selectedTopic;
  final getIt = GetIt.instance;

  late final AdminCubit cubit = getIt.get<AdminCubit>();

  final Function(TopicItem) onSaveClicked;

  SelectedTopicEditWidget(
      {Key? key, required this.selectedTopic, required this.onSaveClicked})
      : super(key: key);

  @override
  _SelectedTopicEditWidgetState createState() =>
      _SelectedTopicEditWidgetState();
}

// Define the State class
class _SelectedTopicEditWidgetState extends State<SelectedTopicEditWidget> {
  static const int title = -10;
  static const int dateId = -11;
  TopicItem? topic;

  Map<int, TextEditingController> controllers = {};
  Map<int, QuillController> controllersQuill = {};

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    topic = widget.selectedTopic;
    updateControllers();
    print("time ${DateTime.now()}$topic");
  }

  void updateControllers() {
    topic?.content?.data.forEach((item) {
      controllers.putIfAbsent(
          item.date, () => TextEditingController(text: item.text));
    });

    // topic?.content?.data.forEach((item) {
    //   controllersQuill.putIfAbsent(item.date, () => QuillController.basic());
    // });

    // controllersQuill.forEach((key, value) {
    //   final json = jsonDecode(r'{"insert":"hello\n"}');
    //
    //   value.document = Document.fromJson(json);
    // });

    var item = topic?.content?.title;
    if (item != null) {
      controllers.putIfAbsent(title, () => TextEditingController(text: item));
    }

    var date = topic?.date;
    if (date != null) {
      controllers.putIfAbsent(dateId, () => TextEditingController(text: date.toIso8601String()));
    }
  }

  void onTextChange(String value, int date) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      saveTopicDataItems();
    });
  }

  void saveTopicDataItems() {
    var updatedData = topic?.content?.data.map((item) {
      return item.copyWith(text: controllers[item.date]?.text ?? item.text);
    }).toList();

    if (updatedData != null) {
      print("$updatedData saved");
      setState(() {
        topic = topic?.copyWith(
          content: topic?.content?.copyWith(data: updatedData),
        );
      });
    }
  }

  void updateTopicDate(String value) {
    var parsed = DateTime.parse(value);
    setState(() {
      topic = topic?.copyWith(date: parsed);
    });
  }

  void updateTopicTitle(String value) {
    setState(() {
      topic = topic?.copyWith(content: topic?.content?.copyWith(title: value));
    });
  }

  void addTopicDataItem() {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      topic = topic?.copyWith(
          content: topic?.content?.copyWith(
        data: List.from(topic?.content?.data ?? [])
          ..add(TopicDataItem(date: currentTime, text: "")),
      ));
      updateControllers();
    });
  }

  void removeTopicDataItem(TopicDataItem itemToRemove) {
    if ((topic?.content?.data?.length ?? 0) > 1) {
      setState(() {
        topic = topic?.copyWith(
          content: topic?.content?.copyWith(
            data: List.from(topic?.content?.data ?? [])..remove(itemToRemove),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            children: [topicTitleItem(), topicDateItem()],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 600,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: topic?.content?.data.length ?? 0,
              itemBuilder: (context, index) {
                var item = topic?.content?.data[index];
                if (item == null) return Text("null");
                var removable = topic?.content?.data.length != 1 && index != 1;
                return topicPostItem(item, removable);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: HoverButton(
                  onTap: () {
                    widget.onSaveClicked(topic!);
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "save",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade200,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget topicPostItemRich(TopicDataItem item, bool removable) {
    var controller = controllersQuill[item.date];
    if (controller == null) return Text("Null controller");

    return InfoBlock(
      color: Colors.yellow.shade200.withAlpha(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoBlock(
/*            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "text",
                labelStyle:
                GoogleFonts.robotoMono(fontSize: 12, color: Colors.white),
              ),
              controller: controller,
              onChanged: (value) => onTextChange(value, item.date),
              style: GoogleFonts.robotoMono(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),*/
            child: QuillProvider(
              configurations: QuillConfigurations(
                controller: controller,
                sharedConfigurations: QuillSharedConfigurations(
                  locale: Locale('ua'),
                ),
              ),
              child: Column(
                children: [
                  const QuillToolbar(),
                  Expanded(
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                        readOnly: false,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HoverButton(
                  onTap: () {
                    removeTopicDataItem(item);
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "remove",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent.shade200,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                HoverButton(
                  onTap: () {
                    addTopicDataItem();
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "add new line",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade200,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topicPostItem(TopicDataItem item, bool removable) {
    var controller = controllers[item.date];
    if (controller == null) return Text("Null controller");

    return InfoBlock(
      color: Colors.yellow.shade200.withAlpha(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoBlock(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "text",
                labelStyle:
                    GoogleFonts.robotoMono(fontSize: 12, color: Colors.white),
              ),
              controller: controller,
              onChanged: (value) => onTextChange(value, item.date),
              style: GoogleFonts.robotoMono(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HoverButton(
                  onTap: () {
                    removeTopicDataItem(item);
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "remove",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent.shade200,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                HoverButton(
                  onTap: () {
                    addTopicDataItem();
                  },
                  onDoubleTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "add new line",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade200,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topicTitleItem() {
    var controller = controllers[title];
    if (controller == null) return Container();

    return InfoBlock(
      color: Colors.yellow.shade200.withAlpha(30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: InfoBlock(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "title",
                          labelStyle: GoogleFonts.robotoMono(
                              fontSize: 12, color: Colors.white),
                        ),
                        controller: controller,
                        onChanged: (value) => updateTopicTitle(value),
                        style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  )
                ])
          ]),
    );
  }

  Widget topicDateItem() {
    var controller = controllers[dateId];
    if (controller == null) return Container();

    return InfoBlock(
      color: Colors.yellow.shade200.withAlpha(30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: InfoBlock(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "date",
                          labelStyle: GoogleFonts.robotoMono(
                              fontSize: 12, color: Colors.white),
                        ),
                        controller: controller,
                        onChanged: (value) => updateTopicDate(value),
                        style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  )
                ])
          ]),
    );
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    controllers.values.forEach((controller) => controller.dispose());
    controllersQuill.values.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
