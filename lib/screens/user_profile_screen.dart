import 'package:flutter/material.dart';
import 'package:flutter_commit_list_app/http/http_service.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({ Key? key }) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final HttpService httpService = HttpService();
  late Map userProfile;
  bool isloading = true;

  getGitHubUser() async{
    // UserProfile userProfile;
    userProfile = await httpService.getGithubUser();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isloading = true;
    getGitHubUser();
  }

  @override
  Widget build(BuildContext context) {
    return isloading ? const CircularProgressIndicator() : Column(
      children: [
        const SizedBox(height: 35,),
        Container(
          margin: const EdgeInsets.all(25),
          height: 180,
          width: 180,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(userProfile['avatar_url'] ?? ''),
          ),
        ),
        Text(userProfile['name'] ?? '', style: const TextStyle(color: Colors.white, fontSize: 28)),
        const SizedBox(height: 6,),
        Text('@'+ (userProfile['login'] ?? ''), style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 20,),
        Text('Bio:' + (userProfile['bio'] ?? ''), style: const TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 18,),
        Text('Public Repos: ' + (userProfile['public_repos'].toString()),style: const TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 10,),
        Text('Public Gists: ' + (userProfile['public_gists'].toString()), style: const TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 10,),
        const Text('Private Repos: ',style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}