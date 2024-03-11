import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/hover_button.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/link_utils.dart";
import "package:onelenykco/app/common/ui/rounded_container.dart";

class DesignPart extends StatefulWidget {
  const DesignPart({super.key});

  @override
  _DesignPartState createState() => _DesignPartState();
}

class CircleButton extends StatefulWidget {
  const CircleButton(
      {super.key,
      required this.size,
      required this.hoverColor,
      required this.rippleColor,
      required this.backgroundColor,
      required this.onTap,
      required this.child});

  final Widget child;
  final double size;
  final Color hoverColor;
  final Color rippleColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                  color: widget.backgroundColor, shape: BoxShape.circle),
              child: widget.child),
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: _isHovering
                      ? widget.hoverColor.withOpacity(0.4)
                      : Colors.transparent,
                  shape: BoxShape.circle),
              child: Material(
                type: MaterialType.circle,
                color: Colors.transparent,
                child: InkWell(
                  onHover: (final value) {
                    setState(() {
                      _isHovering = value;
                    });
                  },
                  hoverColor: Colors.transparent,
                  customBorder: const CircleBorder(),
                  splashColor: widget.rippleColor.withOpacity(0.4),
                  // Customize ripple color and opacity
                  onTap: widget.onTap, // Handle tap
                ),
              ),
            ),
          ),
        ],
      );
}

class _DesignPartState extends State<DesignPart> {
  Widget buildOld() => RoundedContainerWidget(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "contact me on:",
                style: GoogleFonts.robotoMono(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                    color: Colors.white,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Transform.scale(
                        scale: 1.25, // Adjust the scale as needed
                        child: Icon(
                          Icons.telegram_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
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
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        FontAwesomeIcons.linkedinIn,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                    height: 8,
                  ),
                  HoverButton(
                    onTap: () {
                      openLink(
                        "https://www.instagram.com/makemegreatagain.pleasure/",
                      );
                    },
                    onDoubleTap: () {},
                    radius: 15,
                    child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
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
                      child: Icon(
                        FontAwesomeIcons.githubAlt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    child: false
                        ? HoverButton(
                            onTap: () {
                              downloadPdfFromAssets(
                                "assets/resume.pdf",
                              );
                            },
                            onDoubleTap: () {},
                            radius: 15,
                            child: const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                FontAwesomeIcons.download,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          )
                        : HoverButton(
                            onTap: () {},
                            onDoubleTap: () {},
                            radius: 15,
                            child: const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                FontAwesomeIcons.camera,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

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

  @override
  Widget build(final BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoBlock(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RectangularButton(
                    hoverColor: Colors.grey,
                    rippleColor: Colors.grey,
                    backgroundColor: Colors.transparent,
                    onTap: () {
                      print('Circle Button Clicked!');
                    },
                    child: const Icon(
                      Icons.telegram_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  RectangularButton(
                      hoverColor: Colors.grey,
                      rippleColor: Colors.grey,
                      backgroundColor: Colors.transparent,
                      onTap: () {
                        print('Circle Button Clicked!');
                      },
                      child: buildPartLanguages(item: "${1}/${3}")),
                  const SizedBox(
                    width: 8,
                    height: 8,
                  ),
                ],
              ),
            ),
            InfoBlock(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleButton(
                    size: 30,
                    hoverColor: Colors.grey,
                    rippleColor: Colors.grey,
                    backgroundColor: Colors.transparent,
                    onTap: () {
                      print('Circle Button Clicked!');
                    },
                    child: const Icon(
                      Icons.telegram_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                    height: 8,
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
                  const SizedBox(
                    width: 8,
                    height: 8,
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
                  const SizedBox(
                    width: 8,
                    height: 8,
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
            ),
            buildOld(),
            InfoBlock(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleButton(
                    size: 30,
                    hoverColor: Colors.grey,
                    rippleColor: Colors.grey,
                    backgroundColor: Colors.transparent,
                    onTap: () {
                      print('Circle Button Clicked!');
                    },
                    child: const Icon(
                      Icons.telegram_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                    height: 8,
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
                  const SizedBox(
                    width: 8,
                    height: 8,
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
                  const SizedBox(
                    width: 8,
                    height: 8,
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
            ),
            buildNewContactMe(
                download: false,
                telegram: () => {},
                linkedin: () => {},
                instagram: () => {},
                github: () => {},
                resume: () => {},
                screnshoot: () => {})
          ],
        ),
      );
}

Widget buildNewContactMe({
  required final bool download,
  required Function() telegram,
  required Function() linkedin,
  required Function() instagram,
  required Function() github,
  required Function() resume,
  required Function() screnshoot,
}) {
  return RoundedContainerWidget(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "contact me on:",
            style: GoogleFonts.robotoMono(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          Row(
            children: [
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
              const SizedBox(
                width: 8,
                height: 8,
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
              const SizedBox(
                width: 8,
                height: 8,
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
              const SizedBox(
                width: 8,
                height: 8,
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
              const Spacer(),
              Container(
                child: download
                    ? CircleButton(
                        onTap: () {
                          downloadPdfFromAssets(
                            "assets/resume.pdf",
                          );
                        },
                        size: 30,
                        hoverColor: Colors.grey,
                        rippleColor: Colors.grey,
                        backgroundColor: Colors.transparent,
                        child: const SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(
                            FontAwesomeIcons.download,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      )
                    : CircleButton(
                        onTap: () {},
                        size: 30,
                        hoverColor: Colors.grey,
                        rippleColor: Colors.grey,
                        backgroundColor: Colors.transparent,
                        child: const Icon(
                          FontAwesomeIcons.camera,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class RectangularButton extends StatefulWidget {
  const RectangularButton({
    super.key,
    this.width = null,
    this.radius = 12,
    this.height = null,
    required this.hoverColor,
    required this.rippleColor,
    required this.backgroundColor,
    required this.onTap,
    required this.child,
  });

  final Widget child;
  final double radius;
  final double? width;
  final double? height;
  final Color hoverColor;
  final Color rippleColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  _RectangularButtonState createState() => _RectangularButtonState();
}

class _RectangularButtonState extends State<RectangularButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              // For a rectangle, you can add borderRadius for rounded corners.
              borderRadius: BorderRadius.circular(
                  widget.radius), // Optional: rounded corners
            ),
            child: widget.child,
          ),
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: _isHovering
                    ? widget.hoverColor.withOpacity(0.4)
                    : Colors.transparent,
                // Apply borderRadius to match the container's borderRadius
                borderRadius: BorderRadius.circular(
                    widget.radius), // Match container's borderRadius
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onHover: (final value) {
                    setState(() {
                      _isHovering = value;
                    });
                  },
                  hoverColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(widget.radius),
                  // Match container's borderRadius for the ripple effect
                  splashColor: widget.rippleColor.withOpacity(0.4),
                  // Customize ripple color and opacity
                  onTap: widget.onTap, // Handle tap
                ),
              ),
            ),
          ),
        ],
      );
}
