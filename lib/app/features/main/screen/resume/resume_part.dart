import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get_it/get_it.dart";
import "package:glowy_borders/glowy_borders.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:onelenykco/app/common/ui/rounded_container.dart";
import "package:onelenykco/app/features/main/data/blog/note.dart";
import "package:onelenykco/app/features/main/data/profile/education_item.dart";
import "package:onelenykco/app/features/main/data/profile/employment_item.dart";
import "package:onelenykco/app/features/main/data/resume/resume_cubit.dart";
import "package:onelenykco/app/features/main/data/resume/resume_state.dart";
import "package:onelenykco/app/features/main/screen/design/design.dart";
import "package:onelenykco/app/features/main/screen/resume/pdf_generator.dart";

import "package:screenshot/screenshot.dart";

import "../../../../common/ui/powered_flutter.dart";
import "../base/responsive_state.dart";
import "../blog/blog_page.dart";

class ResumePart extends StatefulWidget {
  ResumePart({super.key});

  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  @override
  _ResumePartState createState() => _ResumePartState(cubit);
}

class _ResumePartState
    extends ResponsiveState<ResumePart, ResumeState, ResumeCubit> {
  _ResumePartState(super.cubit);

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Future<void> onStateChange(
    final BuildContext context,
    final ResumeState state,
  ) async {
    if (state.doScreenShot) {
      await _doScreenshot();
      cubit.screenShotConsumed();
    }
  }

  @override
  Widget buildDesktopLayout(
    final BuildContext context,
    final ResumeState state,
  ) {
    if (state.isScreenshotMode) {
      return desktopScreenShotLayout(state);
    } else {
      return desktopLayout(state);
    }
  }

  @override
  Widget buildMobileLayout(
    final BuildContext context,
    final ResumeState state,
  ) =>
      SingleChildScrollView(
        child: mobileLayout(state),
      );

  Future<void> _doScreenshot() async => screenshotController
          .capture(delay: const Duration(milliseconds: 10))
          .then((final capturedImage) async {
        PdfGenerator.savePdf(capturedImage!, "resume.pdf");
        PdfGenerator.showCapturedWidget(context, capturedImage);
      }).catchError(print);

  Widget mobileLayout(final ResumeState state) => InfoBlock(
        radius: 0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white24,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Part1Widget(
                    state: state,
                  ),
                  const SizedBox(
                    width: 32,
                    height: 32,
                  ),
                  Part2Widget(state: state),
                  const SizedBox(
                    width: 32,
                    height: 32,
                  ),
                  Part3Widget(state: state),
                ],
              ),
            ),
          ),
        ),
      );

  Widget desktopLayout(final ResumeState state) => Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF343540),
            borderRadius: BorderRadius.circular(0),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runSpacing: 10,
              children: [
                Part1Widget(state: state),
                const SizedBox(
                  width: 32,
                  height: 32,
                ),
                Part2Widget(state: state),
                const SizedBox(
                  width: 32,
                  height: 32,
                ),
                Part3Widget(state: state),
              ],
            ),
          ),
        ),
      );

  /*  Future<void> _doScreenshot() async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((final capturedImage) async {
      PdfGenerator.savePdf(capturedImage!, "resume.pdf");
      PdfGenerator.showCapturedWidget(context, capturedImage);
    }).catchError(print);
  }*/

  Widget desktopScreenShotLayout(final ResumeState state) => Center(
        child: Screenshot(
          controller: screenshotController,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF343540),
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      Part1Widget(state: state),
                      const SizedBox(
                        width: 32,
                        height: 32,
                      ),
                      Part2Widget(state: state),
                      const SizedBox(
                        width: 32,
                        height: 32,
                      ),
                      Part3Widget(state: state),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                PoweredByFlutterWidget()
              ],
            ),
          ),
        ),
      );
}

class Part1Widget extends StatefulWidget {
  final getIt = GetIt.instance;
  late final ResumeCubit cubit = getIt.get<ResumeCubit>();

  Part1Widget({final Key? key, required this.state}) : super(key: key);
  final ResumeState state;

  @override
  State<Part1Widget> createState() => _Part1WidgetState();
}

class _Part1WidgetState extends State<Part1Widget>
    with SingleTickerProviderStateMixin {
  double rotationAngle = 0;

  bool isFlipped = false;

  double minValue = 0;
  double maxValue = 100;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation = Tween<double>(begin: minValue, end: maxValue).animate(curve)
      ..addListener(() {
        setState(() {
          _flipImage(
            context,
            _animation.value,
          );
        });
      });
  }

  void _flipImage(final BuildContext context, final double position) {
    if (ModalRoute.of(context)?.isCurrent != true) {
      return;
    }

    final halfWidth = maxValue / 2;

    setState(() {
      rotationAngle = _calculateRotationAngle(position, halfWidth);
      isFlipped = _shouldFlip(position, halfWidth);
    });
  }

  double _calculateRotationAngle(final double mouseX, final double halfWidth) {
    const maxRotation = pi / 8; // Maximum rotation angle (30 degrees)
    final offset = mouseX - halfWidth;
    return min(
      max(-maxRotation, offset / halfWidth * maxRotation),
      maxRotation,
    );
  }

  bool _shouldFlip(final double mouseX, final double halfWidth) =>
      mouseX > (maxValue / 2);

  bool randomBoolean() {
    final random = Random();
    // Generate a random integer and check if it's even or odd
    // If even, return true; if odd, return false
    return random.nextInt(2) == 0;
  }

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
                  0.0,
                  16,
                ) // Translates the widget by 22 pixels downwards
                ..rotateY(
                  isFlipped ? pi : 0,
                ) // Flips the widget horizontally if isFlipped is true
                ..rotateZ(isFlipped ? rotationAngle : -rotationAngle),
              // Rotates the widget
              child: SizedBox(
                width: 114,
                height: 104,
                child: SvgPicture.asset(
                  "assets/svg/head.svg",
                ),
              ),
            ),
            Transform.flip(
              flipX: isFlipped,
              child: SvgPicture.asset(
                "assets/svg/body.svg",
                width: 133,
                height: 130,
              ),
            ),
          ],
        ),
      );

  Widget buildPart1(final ResumeState state) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "resume 2.0",
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "onelenyk.dev",
                style: GoogleFonts.robotoMono(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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
                              fontWeight: FontWeight.bold,
                            ),
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
                              fontWeight: FontWeight.bold,
                            ),
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
                              fontSize: 14,
                              color: Colors.white,
                            ),
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
        buildNewContactMe(
            download: !state.isScreenshotMode,
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
            screnshoot: () {
              widget.cubit.dispatchScreenShot();
            })
      ],
    );
  }

  @override
  Widget build(final BuildContext context) {
    // Your buildPart1 code here, for example:
    return buildPart1(widget.state);
  }
}

class Part2Widget extends StatefulWidget {
  const Part2Widget({final Key? key, required this.state}) : super(key: key);
  final ResumeState state;

  @override
  State<Part2Widget> createState() => _Part2WidgetState();
}

class _Part2WidgetState extends State<Part2Widget> {
  final int _itemsPerPage = 2;
  int _currentPage = 0;

  //util
  String formatDatePeriod(
    final DateTime startDate, [
    DateTime? endDate,
    final bool addSpentYears = true,
  ]) {
    String formatDate(final DateTime date) =>
        "${_monthName(date.month)} ${date.year}";
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
          animationTime: 6,
          stretchAlongAxis: true,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: InfoBlock(
            padding: EdgeInsets.zero,
            child: buildPartExpandedWorkExperience(item: item),
          ),
        ),
      );
    } else {
      return InfoBlock(
          padding: const EdgeInsets.all(8),
          child: buildPartExpandedWorkExperience(item: item));
    }
  }

  Widget buildPartExpandedWorkExperience(
          {required final ExperienceItem item}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: GoogleFonts.robotoMono(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Text(
                        item.role,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formatDatePeriod(
                        item.startDate.toDate(),
                        item.endDate?.toDate(),
                      ),
                      style: GoogleFonts.robotoMono(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                item.description.join(",\n"),
                //  maxLines: 6,
                softWrap: true,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      );

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
              Text(
                item.universityName,
                style: GoogleFonts.robotoMono(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 4,
            height: 4,
          ),
          Wrap(
            children: [
              Text(
                titleAndDate,
                style: GoogleFonts.robotoMono(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Divider(
        height: 4,
        thickness: 1,
        color: Colors.white,
      );

  Widget _buildDefaultMode(final ResumeState state) {
    final totalPagesIndex =
        (state.profile.experience.length / _itemsPerPage).ceil();
    final totalPages = totalPagesIndex - 1;
    final experiences = state.profile.experience;
    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    final itemsToShow = experiences.sublist(startIndex,
        endIndex > experiences.length ? experiences.length : endIndex);

    return SelectionArea(
      child: Container(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "work experience",
                      style: GoogleFonts.robotoMono(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RectangularButton(
                        hoverColor: Colors.grey,
                        rippleColor: Colors.grey,
                        backgroundColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentPage == totalPages
                                ? _currentPage = 0
                                : _currentPage++;
                          });
                        },
                        child: buildPartLanguages(
                            item:
                                "${_currentPage}/${totalPages} ${_currentPage == totalPages ? "next" : "next"}")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildDivider(),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // Add this to prevent scrolling issues.
              itemCount: itemsToShow.length,
              itemBuilder: (final context, final index) {
                // final item = state.profile.experience[index];
                final item = itemsToShow[index];
                return buildPartWorkExperience(
                    item: item); // Assuming this is defined elsewhere.
              },
              separatorBuilder: (final _, final __) => const SizedBox(height: 8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkExperienceList(final List<ExperienceItem> experiences) =>
      Column(
        mainAxisSize: MainAxisSize.min, // Use as little space as possible
        crossAxisAlignment: CrossAxisAlignment.start,
        children: experiences
            .map((final experience) => Container(
                width: 350, child: buildPartWorkExperience(item: experience)))
            .toList(),
      );

  Widget _buildHorizontalPages(
      final List<ExperienceItem> experiences, final int itemsPerPage) {
    // Split the experiences into chunks/pages
    List<List<ExperienceItem>> pages = [];
    for (int i = 0; i < experiences.length; i += itemsPerPage) {
      int end = (i + itemsPerPage < experiences.length)
          ? i + itemsPerPage
          : experiences.length;
      pages.add(experiences.sublist(i, end));
    }

    // Building a list of widgets for each page
    List<Widget> pageWidgets =
        pages.map((final page) => _buildWorkExperienceList(page)).toList();

    // Using SingleChildScrollView and Row for horizontal scrolling
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: pageWidgets,
          ),
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 1, // Thickness of the line
              color: Colors.white, // Color of the line
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenshotMode(final ResumeState state) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "work experience",
              style: GoogleFonts.robotoMono(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
            width: 8,
          ),
          _buildHorizontalPages(state.profile.experience, 2)
        ],
      );

  Widget _buildWorkExperience(final ResumeState state) => state.isScreenshotMode
      ? _buildScreenshotMode(state)
      : _buildDefaultMode(state);

  Widget buildPartLanguages({required final String item}) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          item,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  Widget _buildEducationExperience(final ResumeState state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Text(
              "education",
              style: GoogleFonts.robotoMono(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
            child: _buildDivider(),
          ),
          buildPartEducationExperience(item: state.profile.education),
        ],
      );

  Widget buildPart2({required final ResumeState state}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoBlock(
            padding: EdgeInsets.zero,
            child: _buildWorkExperience(state),
          ),
          const SizedBox(
            height: 12,
            width: 350,
          ),
          InfoBlock(
            padding: EdgeInsets.zero,
            width: 350,
            child: _buildEducationExperience(state),
          ),
        ],
      );

  @override
  Widget build(final BuildContext context) {
    // Your buildPart2 code here
    return buildPart2(state: widget.state);
  }
}

class Part3Widget extends StatelessWidget {
  const Part3Widget({final Key? key, required this.state}) : super(key: key);
  final ResumeState state;

  Widget buildPart3({required final ResumeState state}) {
    final items = state.profile.skills;

    final Note resumeabout = Note(
      note: state.profile.description,
      id: "resume",
      date: DateTime.parse("2024-04-10"),
    );

    return Column(
      children: [
        InfoBlock(
          width: 350,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "about",
                    style: GoogleFonts.robotoMono(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                    width: 8,
                  ),
                  Divider(
                    height: 4,
                    thickness: 1,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 8,
                    width: 8,
                  ),
                  MyPostWidget(
                    note: resumeabout,
                    post: false,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: InfoBlock(
            width: 350,
            padding: const EdgeInsets.all(16),
            // color: Colors.deepOrange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "skills",
                  style: GoogleFonts.robotoMono(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                  width: 8,
                ),
                Divider(
                  height: 4,
                  thickness: 1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                  width: 8,
                ),
                Wrap(
                  runSpacing: 5,
                  spacing: 5, // Horizontal direction for Wrap widget
                  children: items
                      .map(
                        (final item) => buildPartSkills(
                          item: item,
                          lastItem: item != items.last,
                        ),
                      )
                      .toList(), // Creating a text widget for each item
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedContainerWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "languages",
                      style: GoogleFonts.robotoMono(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    children: state.profile.languages
                        .map(
                          (final item) => buildPartLanguages(item: item),
                        )
                        .toList(), // Creating a text widget for each item
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
        child: Text(
          item,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  Widget buildPartSkills({
    required final String item,
    required final bool lastItem,
  }) =>
      Text(
        "$item${lastItem ? "," : "."}",
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  Widget build(final BuildContext context) => buildPart3(state: state);
}

class TopBorderDecoration extends Decoration {
  const TopBorderDecoration({
    required this.borderColor,
    required this.borderWidth,
    required this.borderPadding,
  });

  final Color borderColor;
  final double borderWidth;
  final EdgeInsets borderPadding;

  @override
  EdgeInsetsGeometry get padding => borderPadding;

  @override
  BoxPainter createBoxPainter([final VoidCallback? onChanged]) =>
      TopBorderDecorationPainter(
        borderColor: borderColor,
        borderWidth: borderWidth,
        padding: borderPadding,
      );
}

class TopBorderDecorationPainter extends BoxPainter {
  TopBorderDecorationPainter({
    required this.borderColor,
    required this.borderWidth,
    required this.padding,
  });

  final Color borderColor;
  final double borderWidth;
  final EdgeInsets padding;

  @override
  void paint(final Canvas canvas, final Offset offset,
      final ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Calculate the position for the top border
    final double top = offset.dy + padding.top;
    final double left = offset.dx + padding.left;
    final double right = offset.dx + configuration.size!.width - padding.right;

    // Draw the top border line
    canvas.drawLine(Offset(left, top), Offset(right, top), paint);
  }
}
