import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:url_launcher/url_launcher.dart";

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

  String? encodeQueryParameters(final Map<String, String> params) => params.entries
        .map((final e) =>
            "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}",)
        .join("&");

  @override
  Widget build(final BuildContext context) => Center(
      child: SingleChildScrollView(
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
                          fontSize: 16, color: Colors.white,),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Hire me!🔥",
                          style: GoogleFonts.robotoMono(
                              fontSize: 24, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ),),
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
                          fontWeight: FontWeight.normal,),
                      "If there is anything I can do for you, please feel free to get in touch.\nHere are some ways to do so:",),
                ),),
            const SizedBox(
              height: 8,
            ),
            InfoBlock(
                width: 350,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                                style: GoogleFonts.robotoMono(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,),
                                "tg",),
                            const SizedBox(
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
                                    "assets/svgs/tg.svg",
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn,),
                                    width: 16,
                                    height: 16,
                                  ),),
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
                                    fontWeight: FontWeight.normal,),
                                "link",),
                            const SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink(
                                    "https://www.linkedin.com/in/onelenyk/",);
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(FontAwesomeIcons.linkedinIn,
                                      color: Colors.white, size: 20,),),
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
                                    fontWeight: FontWeight.normal,),
                                "inst",),
                            const SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink(
                                    "https://www.instagram.com/makemegreatagain.pleasure/",);
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(FontAwesomeIcons.instagram,
                                      color: Colors.white, size: 20,),),
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
                                    fontWeight: FontWeight.normal,),
                                "git",),
                            const SizedBox(
                              width: 8,
                            ),
                            HoverButton(
                              onTap: () {
                                openLink("https://github.com/onelenyk/");
                              },
                              onDoubleTap: () {},
                              radius: 15,
                              child: const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(FontAwesomeIcons.githubAlt,
                                      color: Colors.white, size: 20,),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),),
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
                          fontWeight: FontWeight.normal,),
                      "Or just email me",),
                ),),
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
                            fontWeight: FontWeight.normal,),
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "example@mail.com",
                          errorStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.normal,),
                          labelStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,),
                          hintStyle: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,),
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
                            fontWeight: FontWeight.normal,),
                        decoration: InputDecoration(
                          labelText: "Email Body",
                          hintText: "I would like to hire you!",
                          errorStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.normal,),
                          labelStyle: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,),
                          hintStyle: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,),
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
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Text(
                            "SEND",
                            style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,),
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
