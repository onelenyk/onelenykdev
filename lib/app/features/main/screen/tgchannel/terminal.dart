import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/image_saver.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/what_is_it.dart";
import "package:screenshot/screenshot.dart";

import "../../../../common/hover_button.dart";
import "gradle_post.dart";
import "markdown_renderer.dart";

class TerminalView extends StatelessWidget {
  final WhatIsItModel params;

  const TerminalView({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: params.backgroundColor,
          border: Border.all(color: params.backgroundColor),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: params.backgroundPadding,
        child: Container(
          width: 430,
          height: 400,
          decoration: BoxDecoration(
            color: params.terminalBgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildTerminalHeader(),
                Divider(color: params.separatorColor),
                _buildTopicTitle(),
                Divider(color: params.separatorColor),
                _buildMarkdownContentText(),
                Spacer(),
                Divider(color: params.separatorColor),
                _buildTelegramChannelName(),
              ],
            ),
          ),
        ),
      );

  Widget _buildTerminalHeader() => Container(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildButton(params.buttonRed),
                _buildButton(params.buttonYellow),
                _buildButton(params.buttonGreen),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset("svg/dailycodefreestyle.svg"),
                ),
                const SizedBox(width: 10),
                Text(
                  'What is it',
                  style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildTopicTitle() => Container(
        color: params.titleBgColor,
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.network(
              params.topicIcon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              params.topicName,
              style: GoogleFonts.robotoMono(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: params.titleColor,
              ),
            ),
          ],
        ),
      );

  Widget _buildMarkdownContentText() => Container(
        color: params.contentBgColor,
        child: MarkdownRenderer(
          data: params.contentText,
          baseTextStyle: GoogleFonts.robotoMono(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: params.contentColor,
          ),
        ),
      );

  Widget _buildTelegramChannelName() => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          '@dailycodefreestyle',
          style: GoogleFonts.robotoMono(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: params.contentColor,
          ),
        ),
      );

  Widget _buildButton(Color color) => Container(
        margin: const EdgeInsets.only(right: 5),
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );
}

class TerminalEditor extends StatefulWidget {
  final WhatIsItModel params;
  final Function(WhatIsItModel) onUpdate;
  final Function() onCancel;

  const TerminalEditor({
    Key? key,
    required this.params,
    required this.onUpdate,
    required this.onCancel,
  }) : super(key: key);

  @override
  _TerminalEditorState createState() => _TerminalEditorState();
}

class _TerminalEditorState extends State<TerminalEditor> {
  late WhatIsItModel _tempParams;
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();

  @override
  void didUpdateWidget(TerminalEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.params != widget.params) {
      setState(() {
        _tempParams = widget.params;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tempParams = widget.params;

    _topicNameController.text = _tempParams.topicName;
    _contentTextController.text = _tempParams.contentText;
  }

  void _saveChanges() {
    setState(() {
      _tempParams = _tempParams.copyWith(
        topicName: _topicNameController.text,
        contentText: _contentTextController.text,
      );
      widget.onUpdate(_tempParams);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
            decoration: BoxDecoration(
              color: _tempParams.backgroundColor,
              border: Border.all(color: _tempParams.backgroundColor),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: _tempParams.backgroundPadding,
            child: Container(
              width: 430,
              height: 400,
              decoration: BoxDecoration(
                color: _tempParams.terminalBgColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildTerminalHeader(),
                    Divider(color: _tempParams.separatorColor),
                    _buildEditableTopicTitle(),
                    Divider(color: _tempParams.separatorColor),
                    _buildEditableContentText(),
                    Spacer(),
                    Divider(color: _tempParams.separatorColor),
                    _buildTelegramChannelName(),
                  ],
                ),
              ),
            ),
          ),

      SizedBox(
        height: 8,
      ),
      Row(
        children: [
          HoverButton(
            onTap: widget.onCancel,
            onDoubleTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "cancel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent.shade200,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          HoverButton(
            onTap: _saveChanges,
            onDoubleTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "save",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent.shade200,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );

  Widget _buildTerminalHeader() => Container(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildButton(_tempParams.buttonRed),
                _buildButton(_tempParams.buttonYellow),
                _buildButton(_tempParams.buttonGreen),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset("svg/dailycodefreestyle.svg"),
                ),
                const SizedBox(width: 10),
                Text(
                  'What is it',
                  style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildEditableTopicTitle() => Container(
        color: _tempParams.titleBgColor,
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.network(
              _tempParams.topicIcon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _topicNameController,
                style: GoogleFonts.robotoMono(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: _currentParams.titleColor,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildMarkdownContentText() => Container(
        color: _currentParams.contentBgColor,
        child: MarkdownRenderer(
          data: _currentParams.contentText,
          baseTextStyle: GoogleFonts.robotoMono(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: _currentParams.contentColor,
          ),
        ),
      );

  Widget _buildContentText() => Container(
        color: _currentParams.contentBgColor,
        child: Text(
          _currentParams.contentText,
          style: GoogleFonts.robotoMono(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: _currentParams.contentColor,
          ),
        ),
      );

  Widget _buildEditableContentText() => Container(
        color: _currentParams.contentBgColor,
        child: TextField(

          controller: _contentTextController,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.robotoMono(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: _currentParams.contentColor,
          ),
          minLines: 1,
          maxLines: 8,

        ),
      );

  Widget _buildButton(Color color) => Container(
        margin: const EdgeInsets.only(right: 5),
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );

  Widget _buildIndex(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          "${_currentParams.id}",
          style: GoogleFonts.robotoMono(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      );

  Widget _buildScreenshotButton(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: HoverButton(
          onTap: () {
            _doScreenshot(context);
          },
          onDoubleTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "download",
              style: GoogleFonts.robotoMono(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      );
}
