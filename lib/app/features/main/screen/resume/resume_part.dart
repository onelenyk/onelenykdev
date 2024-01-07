import "dart:async";
import "dart:math";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";
import "package:glowy_borders/glowy_borders.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:onelenykco/app/common/responsive_util.dart";
import "package:onelenykco/app/common/ui/expandable_widget.dart";
import "package:onelenykco/app/features/main/data/profile/education_item.dart";
import "package:onelenykco/app/features/main/data/profile/employment_item.dart";
import "package:onelenykco/app/features/main/data/resume/resume_cubit.dart";
import "package:onelenykco/app/features/main/data/resume/resume_state.dart";
import "package:onelenykco/app/features/main/screen/resume/pdf_generator.dart";
import "package:screenshot/screenshot.dart";

class ResumePart extends StatefulWidget {
  ResumePart({super.key});

  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  @override
  _ResumePartState createState() => _ResumePartState();
}

class _ResumePartState extends State<ResumePart> {
  bool isFlipped = false;
  double rotationAngle = 0;

  ScreenshotController screenshotController = ScreenshotController();

  //Avatar
  double _calculateRotationAngle(final double mouseX, final double halfWidth) {
    const maxRotation = pi / 8; // Maximum rotation angle (30 degrees)
    final offset = mouseX - halfWidth;
    return min(
        max(-maxRotation, offset / halfWidth * maxRotation), maxRotation,);
  }

  bool _shouldFlip(final double mouseX, final double halfWidth) {
    // Decide whether to flip the image based on the mouse position
    return mouseX > halfWidth;
  }

  bool randomBoolean() {
    final random = Random();
    // Generate a random integer and check if it's even or odd
    // If even, return true; if odd, return false
    return random.nextInt(2) == 0;
  }

  void _flipImage(final PointerEvent details, final BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent != true) {
      return;
    }

    final localPosition = details.localPosition;
    final halfWidth = context.size!.width / 3;

    setState(() {
      rotationAngle = _calculateRotationAngle(localPosition.dx, halfWidth);
      isFlipped = _shouldFlip(localPosition.dx, halfWidth);
    });
  }

  //ui
  Widget buildAnimatedAvatar() => InfoBlock(
      padding: const EdgeInsets.only(bottom: 16),
      color: Colors.deepOrange.shade300,
      width: double.infinity,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(
                  0.0, 16,) // Translates the widget by 22 pixels downwards
              ..rotateY(isFlipped
                  ? pi
                  : 0,) // Flips the widget horizontally if isFlipped is true
              ..rotateZ(isFlipped ? rotationAngle : -rotationAngle),
            // Rotates the widget
            child: SizedBox(
                width: 114,
                height: 104,
                child: SvgPicture.asset(
                  "assets/svgs/head.svg",
                ),),
          ),
          Transform.flip(
            flipX: isFlipped,
            child: SvgPicture.asset(
              "assets/svgs/body.svg",
              width: 133,
              height: 130,
            ),
          ),
        ],
      ),
    );

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

  Widget buildPartColumn(final ResumeState state) => InfoBlock(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white24,
              ),),
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

  Widget buildPartRow(final ResumeState state) => Column(
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
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPart1(state),
                      const SizedBox(
                        width: 32,
                        height: 32,
                      ),
                      Column(
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

  Widget buildPart1(final ResumeState state) {
    const download = true;

    return Column(
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
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "onelenyk.dev",
                style: GoogleFonts.robotoMono(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),
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
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            state.profile.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.robotoMono(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,),
                          ),
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
                                fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Location: ${state.profile.location}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.robotoMono(
                                fontSize: 14, color: Colors.white,),
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
                                fontSize: 14, color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
              buildAnimatedAvatar(),
            ],
          ),
        ),
        Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            child: DottedBorder(
              color: Colors.white,
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: const EdgeInsets.all(8),
              strokeWidth: 1.5,
              dashPattern: const [8, 6],
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact me on:",
                          style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,),),
                      const SizedBox(
                        width: 8,
                        height: 8,
                      ),
                      Row(
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
                                  "assets/svgs/tg.svg",
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn,),
                                  width: 16,
                                  height: 16,
                                ),),
                          ),
                          const SizedBox(
                            width: 8,
                            height: 8,
                          ),
                          HoverButton(
                            onTap: () {
                              openLink("https://www.linkedin.com/in/onelenyk/");
                            },
                            onDoubleTap: () {},
                            radius: 15,
                            child: const SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(FontAwesomeIcons.linkedinIn,
                                    color: Colors.white, size: 20,),),
                          ),
                          const SizedBox(
                            width: 8,
                            height: 8,
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
                          const SizedBox(
                            width: 8,
                            height: 8,
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
                          const Spacer(),
                          Container(
                            child: download
                                ? HoverButton(
                                    onTap: () {
                                      downloadPdfFromAssets(
                                          "assets/resume.pdf",);
                                    },
                                    onDoubleTap: () {},
                                    radius: 15,
                                    child: const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Icon(FontAwesomeIcons.download,
                                            color: Colors.white, size: 16,),),
                                  )
                                : HoverButton(
                                    onTap: _doScreenshot,
                                    onDoubleTap: () {},
                                    radius: 15,
                                    child: const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Icon(FontAwesomeIcons.camera,
                                            color: Colors.white, size: 16,),),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),),
      ],
    );
  }

  Widget buildPart2({required final ResumeState state}) => InfoBlock(
      padding: const EdgeInsets.all(0),
      width: 350,
      child: ListView(
/*              mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,*/
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Work Experience",
                style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
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
                itemCount: state.profile.experience.length ?? 0,
                itemBuilder: (final context, final index) {
                  final item = state.profile.experience[index];
                  return buildPartWorkExperience(item: item);
                },
                separatorBuilder: (final context, final index) => const SizedBox(height: 8),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Education",
                style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 4,
              thickness: 1,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
            height: 12,
          ),
          buildPartEducationExperience(
              item: EducationItem(
            universityName: "WUNU, Ukraine",
            role: "Advanced Computer Integrated Technologies",
            startDate: Timestamp.fromMillisecondsSinceEpoch(1472755920000),
            endDate: Timestamp.fromMillisecondsSinceEpoch(1598986320000),
          ),),
        ],
      ),
    );

  Widget buildPart3({required final ResumeState state}) {
    final items = <String>[
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
      children: [
        InfoBlock(
          width: 350,
          color: Colors.transparent,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Languages",
                    style: GoogleFonts.robotoMono(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,),),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Divider(
                  height: 4,
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  spacing: 8,
                  children: [
                    buildPartLanguages(item: "Ukrainian"),
                    buildPartLanguages(item: "English"),
                  ],
                ),
              ),
            ],
          ),
        ),
        InfoBlock(
            width: 350,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText.rich(
                      TextSpan(
                        style: GoogleFonts.robotoMono(
                            fontSize: 16, color: Colors.white, height: 1.5,),
                        children: <TextSpan>[
                          const TextSpan(text: """I'm Nazar, an """),
                          TextSpan(
                              text: """Android software engineer """,
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 1.5,),),
                          const TextSpan(
                            text:
                                """with over 4 years of experience in diverse sectors like video media production 🎥, utility management 🔧, transport logistics 🚚, and fintech 💰.""",
                          ),
                          const TextSpan(
                              text:
                                  """Skilled in setting up CI/CD systems ⚙️ and adept at identifying, researching, and resolving complex technical issues 🛠️, I ensure optimal functionality.""",),
                          const TextSpan(
                              text:
                                  """I also excel in professional UI building, crafting precise and user-friendly interfaces 👨‍💻 that enhance the overall app experience 📱.""",),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: InfoBlock(
              width: 350,
              padding: const EdgeInsets.all(16),
              color: const Color(0xff2e2e2e),
              // color: Colors.deepOrange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Skills",
                      style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,),),
                  const SizedBox(
                    height: 8,
                    width: 8,
                  ),
                  Wrap(
                    runSpacing: 5,
                    spacing: 5, // Horizontal direction for Wrap widget
                    children: items
                        .map((final item) => buildPartSkills(
                            item: item, lastItem: item != items.last,),)
                        .toList(), // Creating a text widget for each item
                  ),
                ],
              ),),
        ),
      ],
    );
  }

  Future<void> _doScreenshot() async {
    screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((final capturedImage) async {
      PdfGenerator.savePdf(capturedImage!, "resume.pdf");
      PdfGenerator.showCapturedWidget(context, capturedImage);
    }).catchError(print);
  }

  Widget buildPartWorkExperience({required final ExperienceItem item}) {
    if (item.endDate == null) {
      return Padding(
        padding: const EdgeInsets.all(2),
        child: AnimatedGradientBorder(
          borderSize: 2,
          glowSize: 1,
          gradientColors: const [
            Colors.transparent,
            Colors.transparent,
            Colors.white,
          ],
          animationTime: 4,
          stretchAlongAxis: true,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: InfoBlock(
            padding: EdgeInsets.zero,
            child: ExpandableWidget(
              child1: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(item.name,
                            style: GoogleFonts.robotoMono(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,),),
                        const SizedBox(
                          width: 16,
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text(item.role,
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,),),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 4,
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                            formatDatePeriod(item.startDate.toDate(),
                                item.endDate?.toDate(),),
                            style: GoogleFonts.robotoMono(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,),),
                      ],
                    ),
                  ],
                ),
              ),
              child2: Padding(
                padding: const EdgeInsets.all(6),
                child: buildPartExpandedWorkExperience(item: item),
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: ExpandableWidget(
          child1: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(item.name,
                        style: GoogleFonts.robotoMono(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,),),
                    const SizedBox(
                      width: 16,
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(item.role,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,),),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                        formatDatePeriod(
                            item.startDate.toDate(), item.endDate?.toDate(),),
                        style: GoogleFonts.robotoMono(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,),),
                  ],
                ),
              ],
            ),
          ),
          child2: Padding(
            padding: const EdgeInsets.all(8),
            child: buildPartExpandedWorkExperience(item: item),
          ),
        ),
      );
    }
  }

  Widget buildPartExpandedWorkExperience({required final ExperienceItem item}) => Text(item.description.join(",\n"),
        //  maxLines: 6,
        style: GoogleFonts.roboto(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,),);

  Widget buildPartEducationExperience({required final EducationItem item}) {
    final date =
        "(${item.startDate.toDate().year}-${item.endDate?.toDate().year})";
    final titleAndDate = "${item.role} $date";
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Text(item.universityName,
                  style: GoogleFonts.robotoMono(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,),),
            ],
          ),
          const SizedBox(
            width: 4,
            height: 4,
          ),
          Wrap(
            children: [
              Text(titleAndDate,
                  style: GoogleFonts.robotoMono(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,),),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPartLanguages({required final String item}) => Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(item,
          style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,),),
    );

  Widget buildPartSkills({required final String item, required final bool lastItem}) => Text("$item${lastItem ? "," : "."}",
        style: GoogleFonts.roboto(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,),);

  Widget buildPage(final BuildContext context, final ResumeState state) {
    if (ResponsiveUtil.isDesktop(context)) {
      return SizedBox(
        child: MouseRegion(
          onHover: (final details) => _flipImage(details, context),
          child: buildPartRow(state),
        ),
      );
    } else {
      return SizedBox(
        child: SingleChildScrollView(
          child: MouseRegion(
              onHover: (final details) => _flipImage(details, context),
              child: buildPartColumn(state),),
        ),
      );
    }
  }

  @override
  Widget build(final BuildContext context) => BlocConsumer<ResumeCubit, ResumeState>(
      listener: (final context, final state) {
        return;
      },
      bloc: widget.cubit, // Provide the cubit
      builder: (final context, final state) {
        return Center(child: buildPage(context, state));
        //   return buildPage(context, state);
      },
    );
}

String formatDatePeriod(final DateTime startDate,
    [DateTime? endDate, final bool addSpentYears = true,]) {
  String formatDate(final DateTime date) => "${_monthName(date.month)} ${date.year}";
  final startFormatted = formatDate(startDate);
  final endFormatted = endDate == null ? "Present" : formatDate(endDate);

  endDate = endDate ?? DateTime.now();
  var yearsDifference = endDate.year - startDate.year;
  var monthsDifference = endDate.month - startDate.month;

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

  var years = "";
  var months = "";

  // Append the number of years and months
  if (addSpentYears) {
    years = yearsDifference > 0 ? "${yearsDifference}y," : "";
    months = monthsDifference > 0 ? "${monthsDifference}m" : "";
  }

  return "$startFormatted - $endFormatted ($years$months)";
}

String _monthName(final int month) {
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  return months[month - 1];
}
