import 'package:flutter/material.dart';

class CommitsScreen extends StatefulWidget {
  const CommitsScreen({ Key? key }) : super(key: key);

  @override
  _CommitsScreenState createState() => _CommitsScreenState();
}

class _CommitsScreenState extends State<CommitsScreen> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, left: 20, right: 10, bottom: 10),
              child: const Text('Flutter Commit List', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            Container(
              height: 25,
              width: 75,
              margin: const EdgeInsets.only(top: 40, left: 10, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                border: Border.all(color: Colors.transparent, width: 0.0),
                borderRadius: const BorderRadius.all(Radius.elliptical(90, 90)),
              ),
              child: const Center(child: Text('master', style: TextStyle(color: Colors.white, fontSize: 20))),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey.shade500)),
                ),
                padding: const EdgeInsets.fromLTRB(0, 8,   8, 8),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Entry ${entries[index]}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                        const Text('11/2/22', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/6655696?v=4"),
                              ),
                        const SizedBox(width: 8),
                        Text('Entry ${entries[index]}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      ]
                    ),
                  ), 
                ),
              );
            }
          ),
        )
      ],
    );
  }
}
