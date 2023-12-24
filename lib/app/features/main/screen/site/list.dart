import 'dart:convert';
import 'package:http/http.dart' as http;

final token = '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'; // Optional: If you have a personal access token


void main() async {
  final username = 'onelenyk';
  final repository = 'onelenykdev';

  final response = await http.get(
    Uri.parse('https://api.github.com/repos/$username/$repository/commits'),
    headers: {
      'Authorization': 'Bearer $token', // Include your token here if needed
      'User-Agent': 'Dart GitHub API Client', // Provide a user-agent header
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> commits = json.decode(response.body);
    for (var commit in commits) {
      final commitMessage = commit['commit']['message'];
      print(commitMessage);
    }
  } else {
    print('Failed to fetch commits. Status code: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}