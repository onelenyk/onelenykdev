import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:url_launcher/url_launcher.dart";

import "../../../../common/ui/rounded_container.dart";
import "../design/design.dart";

class HireMePart extends StatefulWidget {
  const HireMePart({super.key});

  @override
  _HireMePageState createState() => _HireMePageState();
}

class _HireMePageState extends State<HireMePart> {
  final _formKey = GlobalKey<FormState>();
  String _senderEmail = "";
  String _emailBody = "";
  final String _receiverEmail =
      "onelenyk@gmail.com"; // Hardcoded receiver email
  final String _emailSubject =
      "Interest in Hiring | onelenyk.dev"; // Hardcoded email subject

  Future<void> _sendEmail() async {
    final emailLaunchUri = Uri(
      scheme: "mailto",
      path: _receiverEmail,
      query: encodeQueryParameters(<String, String>{
        "subject": _emailSubject,
        "body": "Sender: $_senderEmail\n\n$_emailBody",
      }),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      print(emailLaunchUri);
      print(emailLaunchUri);
      await launchUrl(emailLaunchUri);
    } else {
      throw "Could not launch $emailLaunchUri";
    }
  }

  String? encodeQueryParameters(final Map<String, String> params) =>
      params.entries
          .map(
            (final e) =>
                "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}",
          )
          .join("&");

  Widget buildNewContactMe({
    required Function() telegram,
    required Function() linkedin,
    required Function() instagram,
    required Function() github,
    required Function() resume,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "tg",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: telegram,
                child: const Icon(
                  Icons.telegram_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "link",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: () {
                  print('Circle Button Clicked!');
                },
                child: const Icon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "inst",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: () {
                  print('Circle Button Clicked!');
                },
                child: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
              Text(
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                "git",
              ),
              const SizedBox(
                width: 8,
              ),
              CircleButton(
                size: 30,
                hoverColor: Colors.grey,
                rippleColor: Colors.grey,
                backgroundColor: Colors.transparent,
                onTap: () {
                  print('Circle Button Clicked!');
                },
                child: const Icon(
                  FontAwesomeIcons.githubAlt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoBlock(
                  color: Colors.grey.shade800,
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SelectableText.rich(
                      TextSpan(
                        style: GoogleFonts.robotoMono(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Hire me!🔥",
                            style: GoogleFonts.robotoMono(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InfoBlock(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      style: GoogleFonts.robotoMono(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                      "If there is anything I can do for you, please feel free to get in touch.\nHere are some ways to do so:",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InfoBlock(
                  width: 350,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildNewContactMe(
                        telegram: () {
                          openLink("https://onelenyk.t.me/");
                        },
                        linkedin: () {
                          openLink("https://www.linkedin.com/in/onelenyk/");
                        },
                        instagram: () => {
                          openLink(
                              "https://www.instagram.com/makemegreatagain.pleasure/"),
                        },
                        github: () {
                          openLink("https://github.com/onelenyk/");
                        },
                        resume: () {
                          downloadPdfFromAssets(
                            "assets/resume.pdf",
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InfoBlock(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      style: GoogleFonts.robotoMono(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                      "Or just email me",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InfoBlock(
                  width: 350,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "example@mail.com",
                              errorStyle: GoogleFonts.robotoMono(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                              ),
                              labelStyle: GoogleFonts.robotoMono(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              hintStyle: GoogleFonts.robotoMono(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onSaved: (final value) => _senderEmail = value!,
                            validator: (final value) => value!.contains("@")
                                ? null
                                : "Please enter a valid email",
                          ),
                          TextFormField(
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            decoration: InputDecoration(
                              labelText: "Email Body",
                              hintText: "I would like to hire you!",
                              errorStyle: GoogleFonts.robotoMono(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                              ),
                              labelStyle: GoogleFonts.robotoMono(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              hintStyle: GoogleFonts.robotoMono(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onSaved: (final value) => _emailBody = value!,
                            validator: (final value) => value!.isNotEmpty
                                ? null
                                : "Please enter a message",
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Text(
                                "SEND",
                                style: GoogleFonts.robotoMono(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
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
        ),
      );
}
