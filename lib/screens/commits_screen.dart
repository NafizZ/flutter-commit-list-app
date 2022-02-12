import 'package:flutter/material.dart';
import 'package:flutter_commit_list_app/http/http_service.dart';

class CommitsScreen extends StatefulWidget {
  const CommitsScreen({ Key? key }) : super(key: key);

  @override
  _CommitsScreenState createState() => _CommitsScreenState();
}

class _CommitsScreenState extends State<CommitsScreen> {
  final HttpService httpService = HttpService();
  bool isloading = true;
  late List<dynamic> gitCommitsData;
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K'];

  getGitCommits() async{
    gitCommitsData = await httpService.getGitCommits();
    print("gitCommitsData: ${gitCommitsData[0]['commit']['message']}");
    print("gitCommitsData: ${gitCommitsData[0]['commit']['committer']['date']}");
    print("gitCommitsData: ${gitCommitsData[0]['author']['avatar_url']}");
    print("gitCommitsData: ${gitCommitsData[0]['commit']['author']['name']}");
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isloading = true;
    getGitCommits();
  }
  @override
  Widget build(BuildContext context) {
    return isloading ? const CircularProgressIndicator() : Column(
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
            itemCount: 10,
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
                        Flexible(child: Text(gitCommitsData[index]['commit']['message'], style: const TextStyle(color: Colors.white, fontSize: 16))),
                        Text(gitCommitsData[index]['commit']['committer']['date'], style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(gitCommitsData[index]['author']['avatar_url']),
                        ),
                        const SizedBox(width: 8),
                        Text(gitCommitsData[index]['commit']['author']['name'], style: const TextStyle(color: Colors.white70, fontSize: 12)),
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
