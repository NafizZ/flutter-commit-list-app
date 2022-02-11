import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({ Key? key }) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35,),
        Container(
          margin: const EdgeInsets.all(25),
          height: 180,
          width: 180,
          child: const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/6655696?v=4"),
          ),
        ),
        const Text('Acon',style: TextStyle(color: Colors.white, fontSize: 28)),
        const SizedBox(height: 8,),
        const Text('@yooo', style: TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 18,),
        const Text('Bio: there was once..',style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 18,),
        const Text('Public Repos: 2',style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 10,),
        const Text('Public Gists: 5',style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 10,),
        const Text('Private Repos: 5',style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}