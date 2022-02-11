import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[850],
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.blue[900],
        selectedItemColor: Colors.blueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
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
