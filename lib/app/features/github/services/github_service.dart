import "dart:convert";

import "package:http/http.dart";
import "package:onelenykco/app/env/environment.dart";
import "package:onelenykco/app/features/github/commit_model.dart";

class GithubService {
  Future<List<Commit>> loadCommits() async {
    final login = getGithubLogin();
    final repository = getGithubRepository();
    final token = getGithubToken();

    final response = await get(
      Uri.parse("https://api.github.com/repos/$login/$repository/commits"),
      headers: {
        "Authorization": "Bearer $token", // Include your token here if needed
        "User-Agent": "Dart GitHub API Client", // Provide a user-agent header
      },
    );

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final commits = jsonList.map((final jsonItem) => Commit.fromJson(jsonItem as Map<String, dynamic>)).toList();
      return commits;
    } else {
      print("Failed to fetch commits. Status code: ${response.statusCode}");
      print("Response: ${response.body}");
      return [];
    }
  }
}
