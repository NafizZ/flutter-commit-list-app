import 'package:flutter/material.dart';
import 'package:flutter_commit_list_app/assets/commit_icon.dart';
import 'package:flutter_commit_list_app/screens/commits_screen.dart';
import 'package:flutter_commit_list_app/screens/user_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GTAF Coding Test',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[850],
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _pages = <Widget>[
    CommitsScreen(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        unselectedItemColor: Colors.blue[900],
        selectedItemColor: Colors.blueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CommitIcon.gitCommitIcon),
            label: 'Commits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'User Profile',
          ),
        ],
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped,
      ),
    );
  }
}