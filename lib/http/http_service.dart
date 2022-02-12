import 'dart:convert';
import 'package:http/http.dart';

class HttpService {
  final String gitCommits = "https://api.github.com/repos/flutter/flutter/commits";
  final String githubUser = "https://api.github.com/users/guidezpl";

  Future<List> getGitCommits() async {
    Response res = await get(Uri.parse(gitCommits));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print('body: $body');
      return body;
    } else {
      throw "Unable to retrieve data.";
    }
  }

  Future<Map> getGithubUser() async {
    Response res = await get(Uri.parse(githubUser));

    if (res.statusCode == 200) {
      Map body = jsonDecode(res.body);
      return body;
      // return UserProfile.fromJson(jsonDecode(res.body));
    } else {
      throw "Unable to retrieve images.";
    }
  }
}