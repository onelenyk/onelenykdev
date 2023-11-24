import 'dart:async';
import 'dart:html' as html;

import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:onelenykco/app/common/link_utils.dart';
import 'package:onelenykco/app/common/responsive_util.dart';
import 'package:onelenykco/app/features/main/data/resume/resume_cubit.dart';
import 'package:onelenykco/app/features/main/data/resume/resume_state.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../common/hover_button.dart';
import '../../../../common/info_block.dart';
import '../../../../common/ui/expandable_widget.dart';
import '../../data/profile/education_item.dart';
import '../../data/profile/employment_item.dart';
import 'pdf_generator.dart';

class ResumePart extends StatefulWidget {
  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  @override
  _ResumePartState createState() => _ResumePartState();
}

class _ResumePartState extends State<ResumePart> {
  bool isFlipped = false;
  double rotationAngle = 0.0;

  ScreenshotController screenshotController = ScreenshotController();

  //Avatar
  double _calculateRotationAngle(double mouseX, double halfWidth) {
    const maxRotation = pi / 8; // Maximum rotation angle (30 degrees)
    double offset = mouseX - halfWidth;
    return min(
        max(-maxRotation, offset / halfWidth * maxRotation), maxRotation);
  }

  bool _shouldFlip(double mouseX, double halfWidth) {
    // Decide whether to flip the image based on the mouse position
    return mouseX > halfWidth;
  }

  bool randomBoolean() {
    var random = Random();
    // Generate a random integer and check if it's even or odd
    // If even, return true; if odd, return false
    return random.nextInt(2) == 0;
  }

  void _flipImage(PointerEvent details, BuildContext context) {
    var localPosition = details.localPosition;
    var halfWidth = context.size!.width / 3;

    setState(() {
      rotationAngle = _calculateRotationAngle(localPosition.dx, halfWidth);
      isFlipped = _shouldFlip(localPosition.dx, halfWidth);
    });
  }

  //ui
  Widget buildAnimatedAvatar() {
    return InfoBlock(
      padding: EdgeInsets.only(bottom: 16),
      color: Colors.deepOrange.shade300,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(
                  0.0, 16.0) // Translates the widget by 22 pixels downwards
              ..rotateY(isFlipped
                  ? pi
                  : 0) // Flips the widget horizontally if isFlipped is true
              ..rotateZ(isFlipped ? rotationAngle : -rotationAngle),
            // Rotates the widget
            child: Container(
                width: 114,
                height: 104,
                child: SvgPicture.asset(
                  'assets/svgs/head.svg',
                  fit: BoxFit.contain,
                )),
          ),
          Transform.flip(
            flipX: isFlipped,
            child: SvgPicture.asset(
              'assets/svgs/body.svg',
              width: 133,
              height: 130,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

/*

  Widget buildPartRow(ResumeState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPart1(state),
                  const SizedBox(
                    width: 32,
                    height: 32,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(child: buildPart2(state: state)),
                    ],
                  ),
                  const SizedBox(
                    width: 32,
                    height: 32,
                  ),
                  buildPart3(state:state),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
*/

  Widget buildPartColumn(ResumeState state) {
    var screenSize = MediaQuery.of(context).size;

    return InfoBlock(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.white24,
                style: BorderStyle.solid,
                width: 1.0,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildPart1(state),
              const SizedBox(
                width: 32,
                height: 32,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildPart2(state: state),
                ],
              ),
              const SizedBox(
                width: 32,
                height: 32,
              ),
              buildPart3(state: state),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPart1(ResumeState state) {
    var download = true;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InfoBlock(
          width: 350,
          color: Colors.transparent,
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            bottom: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'onelenyk.dev',
                style: GoogleFonts.robotoMono(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        InfoBlock(
          width: 350,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            state.profile.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.robotoMono(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          flex: 2,
                        ),
                        const VerticalDivider(
                          width: 2,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            softWrap: false,
                            state.profile.role,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.robotoMono(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Location: ${state.profile.location}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.robotoMono(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                        const VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Flexible(
                          child: Text(
                            state.profile.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.robotoMono(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              const Divider(
                height: 4,
                thickness: 1,
                color: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              buildAnimatedAvatar()
            ],
          ),
        ),
        Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            child: DottedBorder(
              color: Colors.white,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(8),
              strokeWidth: 1.5,
              dashPattern: [8, 6],
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Contact me on:',
                          style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 8,
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                          SizedBox(
                            width: 8,
                            height: 8,
                          ),
                          HoverButton(
                            onTap: () {
                              openLink("https://www.linkedin.com/in/onelenyk/");
                            },
                            onDoubleTap: () {},
                            radius: 15,
                            child: Container(
                                width: 30,
                                height: 30,
                                child: Icon(FontAwesomeIcons.linkedinIn,
                                    color: Colors.white, size: 20)),
                          ),
                          SizedBox(
                            width: 8,
                            height: 8,
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
                          SizedBox(
                            width: 8,
                            height: 8,
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
                          Spacer(),
                          Container(
                            child: download
                                ? HoverButton(
                                    onTap: () {
                                      downloadPdfFromAssets('assets/resume.pdf');
                                    },
                                    onDoubleTap: () {},
                                    radius: 15,
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Icon(FontAwesomeIcons.download,
                                            color: Colors.white, size: 16)),
                                  )
                                : HoverButton(
                                    onTap: () {
                                      _doScreenshot();
                                    },
                                    onDoubleTap: () {},
                                    radius: 15,
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Icon(FontAwesomeIcons.camera,
                                            color: Colors.white, size: 16)),
                                  ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget buildPart2({required ResumeState state}) {
    return InfoBlock(
      padding: const EdgeInsets.all(0),
      width: 350,
      child: ListView(
/*              mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,*/
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Work Experience',
                style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Divider(
              height: 4,
              thickness: 1,
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.profile.experience.length ?? 0,
                itemBuilder: (context, index) {
                  var item = state.profile.experience[index];
                  return buildPartWorkExperience(item: item);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ],
          ),

/*          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //TODO update list from state
              buildPartWorkExperience(
                  item: ExperienceItem(
                      name: "VanOnGo",
                      role: "Android Engineer",
                      startDate:
                          DateTime.fromMillisecondsSinceEpoch(1680307200000),
                      endDate: null,
                      description: [], id: '')),
              buildPartWorkExperience(
                  item: ExperienceItem(
                      name: "ALP.COM",
                      role: "Android Engineer",
                      startDate:
                          DateTime.fromMillisecondsSinceEpoch(1669852800000),
                      endDate:
                          DateTime.fromMillisecondsSinceEpoch(1680307199000),
                      description: [], id: '')),
              buildPartWorkExperience(
                  item: ExperienceItem(
                      name: "Axles",
                      role: "Android Engineer",
                      startDate:
                          DateTime.fromMillisecondsSinceEpoch(1593561600000),
                      endDate:
                          DateTime.fromMillisecondsSinceEpoch(1672531199000),
                      description: [
                    "1) Led feature development and maintenance at Axles.",
                    "2) Managed project roadmaps, feature investigations, app releases.",
                    "3) Supported white-label operations, enhancing app versatility.",
                    "4) ⚙️ Configured CI/CD environments using various platforms.",
                    "5) 🛠 Advanced skills in Kotlin, Coroutine Flow, Retrofit, Dagger2, Koin, ExoPlayer; tackled redesigns and Java to Kotlin migrations."
                  ], id: '')),
              buildPartWorkExperience(
                  item: ExperienceItem(
                      name: "Trexoz",
                      role: "Mobile Engineer",
                      startDate:
                          DateTime.fromMillisecondsSinceEpoch(1569888000000),
                      endDate:
                          DateTime.fromMillisecondsSinceEpoch(1596239999000),
                      description: [
                    "1) Led dual app development projects at Trexoz.",
                    "2) Tailored apps to specific client requirements.",
                    "3) Enhanced UI and backend for Android apps.",
                    "4) 🏗 Gained skills in app architecture, using LiveData, MVVM, Kotlin, Data Binding.",
                    "5) 📍 Implemented features with Google Maps and advanced UI components."
                  ], id: '')),
              buildPartWorkExperience(
                  item: ExperienceItem(
                      name: "Infotechcentre",
                      role: "Trainee Engineer",
                      startDate:
                          DateTime.fromMillisecondsSinceEpoch(1546300800000),
                      endDate:
                          DateTime.fromMillisecondsSinceEpoch(1572566399000),
                      description: [
                    "1) Developed Android apps using Kotlin and Java.",
                    "2) Created user-friendly UI for documents and data.",
                    "3) Integrated apps with IoT, merging software and hardware.",
                    "4) Built solid foundation in practical software engineering.",
                    "5) 💡 Used Kotlin, Java, Volley, AsyncTasks, MySQL for expertise."
                  ], id: '')),
            ],
          ),*/

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Education',
                style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Divider(
              height: 4,
              thickness: 1,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
            height: 12,
          ),
          buildPartEducationExperience(
              item: EducationItem(
            universityName: "WUNU, Ukraine",
            role: "Advanced Computer Integrated Technologies",
            startDate: DateTime.fromMillisecondsSinceEpoch(1472755920000),
            endDate: DateTime.fromMillisecondsSinceEpoch(1598986320000),
          )),
        ],
      ),
    );
  }

  Widget buildPart3({required ResumeState state}) {
    final List<String> items = [
      "Kotlin",
      "Java",
      "Android SDK",
      "Android Jetpack",
      "Jetpack Compose",
      "Kotlin Coroutines",
      "Gradle",
      "Git",
      "REST API",
      "CI/CD",
      "Camera 2",
      "MV*",
      "Retrofit 2",
      "Room",
      "Flow",
      "LiveData",
      "Dagger/Hilt/Koin",
      "Firebase",
      "Json",
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InfoBlock(
          width: 350,
          color: Colors.transparent,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Languages',
                    style: GoogleFonts.robotoMono(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 4,
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8,
                  children: [
                    buildPartLanguages(item: 'Ukrainian'),
                    buildPartLanguages(item: 'English'),
                  ],
                ),
              )
            ],
          ),
        ),
        InfoBlock(
            width: 350,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.robotoMono(
                            fontSize: 16, color: Colors.white, height: 1.5),
                        children: <TextSpan>[
                          TextSpan(text: """I'm Nazar, an """),
                          TextSpan(
                              text: """Android software engineer """,
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 1.5)),
                          TextSpan(
                            text:
                                """with over 4 years of experience in diverse sectors like video media production 🎥, utility management 🔧, transport logistics 🚚, and fintech 💰.""",
                          ),
                          TextSpan(
                              text:
                                  """Skilled in setting up CI/CD systems ⚙️ and adept at identifying, researching, and resolving complex technical issues 🛠️, I ensure optimal functionality."""),
                          TextSpan(
                              text:
                                  """I also excel in professional UI building, crafting precise and user-friendly interfaces 👨‍💻 that enhance the overall app experience 📱."""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: InfoBlock(
              width: 350,
              padding: const EdgeInsets.all(16),
              color: Color(0xff2e2e2e),
              // color: Colors.deepOrange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skills',
                      style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8,
                    width: 8,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 5,
                    spacing: 5, // Horizontal direction for Wrap widget
                    children: items
                        .map((item) => buildPartSkills(
                            item: item, lastItem: item != items.last))
                        .toList(), // Creating a text widget for each item
                  )
                ],
              )),
        )
      ],
    );
  }

  Widget buildPartRow(ResumeState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Screenshot(
            controller: screenshotController,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF343540),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPart1(state),
                      const SizedBox(
                        width: 32,
                        height: 32,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(child: buildPart2(state: state)),
                        ],
                      ),
                      const SizedBox(
                        width: 32,
                        height: 32,
                      ),
                      buildPart3(state: state),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _doScreenshot() async {
    screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((capturedImage) async {
      PdfGenerator.savePdf(capturedImage!, "resume.pdf");
      PdfGenerator.showCapturedWidget(context, capturedImage!);
    }).catchError((onError) {
      print(onError);
    });
  }

  Widget buildPartWorkExperience({required ExperienceItem item}) {
    if (item.endDate == null) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: AnimatedGradientBorder(
          borderSize: 2,
          glowSize: 1,
          gradientColors: [
            Colors.transparent,
            Colors.transparent,
            Colors.white
          ],
          animationTime: 4,
          animationProgress: null,
          stretchAlongAxis: true,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: InfoBlock(
            padding: EdgeInsets.zero,
            child: ExpandableWidget(
              child1: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(item.name,
                            style: GoogleFonts.robotoMono(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w900)),
                        SizedBox(
                          width: 16,
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text(item.role,
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 4,
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(formatDatePeriod(item.startDate, item.endDate),
                            style: GoogleFonts.robotoMono(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.normal))
                      ],
                    )
                  ],
                ),
              ),
              child2: Padding(
                padding: const EdgeInsets.all(6.0),
                child: buildPartExpandedWorkExperience(item: item),
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandableWidget(
          child1: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(item.name,
                        style: GoogleFonts.robotoMono(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900)),
                    SizedBox(
                      width: 16,
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(item.role,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 4,
                  height: 4,
                ),
                Row(
                  children: [
                    Text(formatDatePeriod(item.startDate, item.endDate),
                        style: GoogleFonts.robotoMono(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal))
                  ],
                )
              ],
            ),
          ),
          child2: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildPartExpandedWorkExperience(item: item),
          ),
        ),
      );
    }
  }

  Widget buildPartExpandedWorkExperience({required ExperienceItem item}) {
    return Text(item.description.join(",\n"),
        //  maxLines: 6,
        style: GoogleFonts.roboto(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold));
  }

  Widget buildPartEducationExperience({required EducationItem item}) {
    var date = "(${item.startDate.year}-${item.endDate?.year})";
    var titleAndDate = "${item.role} $date";
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(item.universityName,
                  style: GoogleFonts.robotoMono(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900)),
            ],
          ),
          SizedBox(
            width: 4,
            height: 4,
          ),
          Wrap(
            children: [
              Text(titleAndDate,
                  style: GoogleFonts.robotoMono(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal))
            ],
          )
        ],
      ),
    );
  }

  Widget buildPartLanguages({required String item}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(item,
          style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal)),
    );
  }

  Widget buildPartSkills({required String item, required bool lastItem}) {
    return Text("${item}${lastItem ? "," : "."}",
        style: GoogleFonts.roboto(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold));
  }

  Widget buildPage(BuildContext context, ResumeState state) {
    var screenSize = MediaQuery.of(context).size;

    if (ResponsiveUtil.isDesktop(context)) {
      return SizedBox(
        // width: screenSize.width,
        // height: screenSize.height,
        child: MouseRegion(
          onHover: (PointerEvent details) => _flipImage(details, context),
          child: buildPartRow(state),
        ),
      );
    } else {
      return SizedBox(
       /* width: screenSize.width,
        height: screenSize.height,*/
        child: SingleChildScrollView(
          child: MouseRegion(
              onHover: (PointerEvent details) => _flipImage(details, context),
              child: buildPartColumn(state)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResumeCubit, ResumeState>(
      listener: (context, state) {
        return;
      },
      bloc: widget.cubit, // Provide the cubit
      builder: (context, state) {
        return buildPage(context, state);
        //   return buildPage(context, state);
      },
    );
  }
}

String formatDatePeriod(DateTime startDate,
    [DateTime? endDate, bool addSpentYears = true]) {
  String formatDate(DateTime date) => '${_monthName(date.month)} ${date.year}';
  String startFormatted = formatDate(startDate);
  String endFormatted = endDate == null ? 'Present' : formatDate(endDate);

  endDate = endDate ?? DateTime.now();
  int yearsDifference = endDate.year - startDate.year;
  int monthsDifference = endDate.month - startDate.month;

  // Adjust years and months difference
  if (endDate.month < startDate.month ||
      (endDate.month == startDate.month && endDate.day < startDate.day)) {
    yearsDifference--;
    monthsDifference += 12;
  }
  // Consider partial months as full months
  if (endDate.day >= startDate.day) {
    monthsDifference++;
  }

  String years = '';
  String months = '';

  // Append the number of years and months
  if (addSpentYears) {
    years = yearsDifference > 0 ? '${yearsDifference}y,' : '';
    months = monthsDifference > 0 ? '${monthsDifference}m' : '';
  }

  return "$startFormatted - $endFormatted ($years$months)";
}

String _monthName(int month) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  return months[month - 1];
}
