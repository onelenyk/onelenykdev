import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/common/hover_button.dart';
import 'package:onelenykco/app/common/info_block.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
/*

class HireMePart extends StatelessWidget {
  const HireMePart({super.key});

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
    final List<String> items = [
      "test",
      "test2",
      "test3",
      "test3",
      "test4",
      "test45"
    ];
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
*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/link_utils.dart';

class HireMePart extends StatefulWidget {
  @override
  _HireMePageState createState() => _HireMePageState();
}

class _HireMePageState extends State<HireMePart> {
  final _formKey = GlobalKey<FormState>();
  String _senderEmail = '';
  String _emailBody = '';
  final String _receiverEmail =
      'onelenyk@gmail.com'; // Hardcoded receiver email
  final String _emailSubject =
      'Interest in Hiring | onelenyk.dev'; // Hardcoded email subject

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: _receiverEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': _emailSubject,
        'body': 'Sender: $_senderEmail\n\n$_emailBody',
      }),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      print(emailLaunchUri.toString());
      print(emailLaunchUri);
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoBlock(
                color: Colors.grey.shade800,

                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.robotoMono(
                          fontSize: 16, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Hire me!🔥",
                          style: GoogleFonts.robotoMono(
                              fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            InfoBlock(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      "If there is anything I can do for you, please feel free to get in touch.\nHere are some ways to do so:"),
                )),
            SizedBox(
              height: 8,
            ),
            InfoBlock(
                width: 350,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(
                                style: GoogleFonts.robotoMono(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                "tg"),
                            SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink("https://onelenyk.t.me/");
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    'assets/svgs/tg.svg',
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn),
                                    width: 16,
                                    height: 16,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                                style: GoogleFonts.robotoMono(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                "link"),
                            SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink(
                                    "https://www.linkedin.com/in/onelenyk/");
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(FontAwesomeIcons.linkedinIn,
                                      color: Colors.white, size: 20)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                                style: GoogleFonts.robotoMono(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                "inst"),
                            SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink(
                                    "https://www.instagram.com/makemegreatagain.pleasure/");
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(FontAwesomeIcons.instagram,
                                      color: Colors.white, size: 20)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                                style: GoogleFonts.robotoMono(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                "git"),
                            SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink("https://github.com/onelenyk/");
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(FontAwesomeIcons.githubAlt,
                                      color: Colors.white, size: 20)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 8,
            ),
            InfoBlock(

                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      "Or just email me"),
                )),
            SizedBox(
              height: 8,
            ),
            InfoBlock(
              width: 350,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: "example@mail.com",
                          errorStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.normal),
                          labelStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          hintStyle: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onSaved: (value) => _senderEmail = value!,
                        validator: (value) => value!.contains('@')
                            ? null
                            : 'Please enter a valid email',
                      ),
                      TextFormField(
                        style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                          labelText: 'Email Body',
                          hintText: "I would like to hire you!",
                          errorStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.normal),
                          labelStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          hintStyle: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        onSaved: (value) => _emailBody = value!,
                        validator: (value) => value!.isNotEmpty
                            ? null
                            : 'Please enter a message',
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        minLines: 3,
                        maxLength: 250,
                      ),
                      const SizedBox(height: 20),
                      HoverButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _sendEmail();
                          }
                        },
                        onDoubleTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                          child: Text(
                            'SEND',
                            style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
