import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:onelenykco/app/features/main/screen/tgchannel/image_saver.dart";
import "package:screenshot/screenshot.dart";

import "../../../../common/hover_button.dart";
import "gradle_post.dart";
import "markdown_renderer.dart";

class TerminalView extends StatefulWidget {
  final WhatIsItModel params;
  final ScreenshotController screenshotController;
  final Function(WhatIsItModel) onUpdate;

  TerminalView({
    required this.params,
    required this.screenshotController,
    required this.onUpdate,
  });

  @override
  _TerminalViewState createState() => _TerminalViewState();
}

class _TerminalViewState extends State<TerminalView> {
  late WhatIsItModel _currentParams;
  bool _isModifying = false;
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentParams = widget.params;
    _topicNameController.text = _currentParams.topicName;
    _contentTextController.text = _currentParams.contentText;
  }

  void _toggleModifyingMode() {
    setState(() {
      _isModifying = !_isModifying;
      if (!_isModifying) {
        // Save changes and update parameters
        _currentParams = _currentParams.copyWith(
          topicName: _topicNameController.text,
          contentText: _contentTextController.text,
        );
        widget.onUpdate(_currentParams);
      }
    });
  }

  String getCurrentTimeFormatted() {
    DateTime now = DateTime.now();
    return DateFormat('dd-MM-yyyy').format(now);
  }

  Future<void> _doScreenshot(BuildContext context) async {
    try {
      final capturedImage = await widget.screenshotController
          .capture(delay: const Duration(milliseconds: 10));
      final name = "telegram_post_${_currentParams.id}.png";
      if (capturedImage != null) {
        await ImageSaver.saveImage(capturedImage, name);
        await ImageSaver.showCapturedWidget(context, capturedImage);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIndex(context),
          Screenshot(
            controller: widget.screenshotController,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildTerminalContainer()),
          ),
          _buildScreenshotButton(context),
        ],
      );

  Widget _buildTerminalContainer() => Container(
        decoration: BoxDecoration(
          color: _currentParams.backgroundColor,
          border: Border.all(
            color: _currentParams.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: _currentParams.backgroundPadding,
        child: Container(
          width: 430,
          height: 400,
          decoration: BoxDecoration(
            color: _currentParams.terminalBgColor,
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
                Divider(color: _currentParams.separatorColor),
                GestureDetector(
                  onDoubleTap: _toggleModifyingMode,
                  child: _isModifying
                      ? _buildEditableTopicTitle()
                      : _buildTopicTitle(),
                ),
                Divider(color: _currentParams.separatorColor),
                _isModifying
                    ? _buildEditableContentText()
                    : _buildMarkdownContentText(),
                Spacer(),
                Divider(color: _currentParams.separatorColor),
                _buildTelegramChannelName(),
              ],
            ),
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
            color: _currentParams.contentColor,
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
                _buildButton(_currentParams.buttonRed),
                _buildButton(_currentParams.buttonYellow),
                _buildButton(_currentParams.buttonGreen),
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
        color: _currentParams.titleBgColor,
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.network(
              _currentParams.topicIcon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              _currentParams.topicName,
              style: GoogleFonts.robotoMono(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: _currentParams.titleColor,
              ),
            ),
          ],
        ),
      );

  Widget _buildEditableTopicTitle() => Container(
        color: _currentParams.titleBgColor,
        child: Row(
          children: [
            const SizedBox(width: 8),
            SvgPicture.network(
              _currentParams.topicIcon,
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
