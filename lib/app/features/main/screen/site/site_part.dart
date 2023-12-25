import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelenykco/app/env/environment.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:timeago/timeago.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/info_block.dart';
import '../../../../common/link_utils.dart';
import 'package:http/http.dart';

import '../../../github/commit_model.dart';
import '../../../github/services/github_service.dart';

class SiteStoryPart extends StatefulWidget {
  @override
  _SiteStoryPartState createState() => _SiteStoryPartState();
}

class _SiteStoryPartState extends State<SiteStoryPart> {
  String appVersion = 'Unknown';

  List<Commit> commits = [];

  @override
  void initState() {
    super.initState();
    loadVersion();
    loadCommits();
  }

  Future<void> loadCommits() async {
    try {
      var commits = await GithubService().loadCommits();
      setState(() {
        this.commits = commits;
      });
      print("Commits ${commits}");
    } catch (e) {
      print('Error loading commits: $e');
    }
  }

  Future<void> loadVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      setState(() {
        appVersion = "$version+$buildNumber";
      });
    } catch (e) {
      print('Error loading version: $e');
    }
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
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      "the site story"),
                )),
            SizedBox(
              height: 8,
            ),
            InfoBlock(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Latest commits",
                              style: GoogleFonts.robotoMono(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 8,),

                      commits.isNotEmpty ? ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: commits.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = commits[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.commit.message,
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                              Text(item.commit.committer.formatedDate,
                                  style: GoogleFonts.robotoMono(
                                      fontSize: 14,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal)),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 8);
                        },
                      ) : Center(child: CircularProgressIndicator())
                    ],
                  ),
                )),
            SizedBox(height: 8,),

            InfoBlock(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      "current version: $appVersion"),
                )),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
