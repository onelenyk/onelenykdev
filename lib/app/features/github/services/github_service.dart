import "dart:convert";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:http/http.dart";
import 'package:onelenykco/app/features/github/commit_model.dart';
import 'package:onelenykco/app/features/main/screen/site/site_part.dart';
import "package:timeago/timeago.dart";

import "../../../env/environment.dart";

class GithubService {
  Future<List<Commit>> loadCommits() async {
    var login = getGithubLogin();
    var repository = getGithubRepository();
    var token = getGithubToken();

    final response = await get(
      Uri.parse("https://api.github.com/repos/$login/$repository/commits"),
      headers: {
        "Authorization": "Bearer $token", // Include your token here if needed
        "User-Agent": "Dart GitHub API Client", // Provide a user-agent header
      },
    );

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body) as List<dynamic>;
      var commits = jsonList.map((final jsonItem) => Commit.fromJson(jsonItem as Map<String, dynamic>)).toList();
      return commits;
    } else {
      print("Failed to fetch commits. Status code: ${response.statusCode}");
      print("Response: ${response.body}");
      return [];
    }
  }
}
