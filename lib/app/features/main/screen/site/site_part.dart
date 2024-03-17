import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onelenykco/app/common/info_block.dart";
import "package:onelenykco/app/common/ui/powered_flutter.dart";
import "package:onelenykco/app/features/github/commit_model.dart";
import "package:onelenykco/app/features/github/services/github_service.dart";
import "package:package_info_plus/package_info_plus.dart";

import "../../data/blog/note.dart";
import "../blog/blog_page.dart";

class SiteStoryPart extends StatefulWidget {
  const SiteStoryPart({super.key});

  @override
  _SiteStoryPartState createState() => _SiteStoryPartState();
}

class _SiteStoryPartState extends State<SiteStoryPart> {
  String appVersion = "Unknown";

  List<Commit> commits = [];

  @override
  void initState() {
    super.initState();
    loadVersion();
    loadCommits();
  }

  Future<void> loadCommits() async {
    try {
      final commits = await GithubService().loadCommits();
      setState(() {
        this.commits = commits;
      });
      print("Commits $commits");
    } catch (e) {
      print("Error loading commits: $e");
    }
  }

  Future<void> loadVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;

      setState(() {
        appVersion = "$version+$buildNumber";
      });
    } catch (e) {
      print("Error loading version: $e");
    }
  }

  @override
  Widget build(final BuildContext context) {
    final Note resumeabout = Note(
      note: """
I developed this site using Flutter, it's been a really interesting way to learn more about Flutter and Dart, it's cool to have that experience.\n\n
I'm continuing to develop the site.
  """,
      id: "resume",
      date: DateTime.parse("2024-04-10"),
    );

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoBlock(
                  width: 350,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,),
                      "the site story",),),
              const SizedBox(
                height: 8,
              ),
              InfoBlock(
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyPostWidget(
                        note: resumeabout,
                        post: false,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              InfoBlock(
                width: 350,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text("Latest commits",
                            style: GoogleFonts.robotoMono(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,),),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 500),
                      child: commits.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: commits.map((final item) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.commit.message,
                                          style: GoogleFonts.robotoMono(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,),),
                                      Text(item.commit.committer.formatedDate,
                                          style: GoogleFonts.robotoMono(
                                              fontSize: 14,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.normal,),),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),).toList(),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              InfoBlock(
                  width: 350,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,),
                      "current version: $appVersion",),),
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
}
