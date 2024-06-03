import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  List name = [
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
    "حسين",
  ];
  late YoutubePlayerController controller;
  @override
  void initState() {
    const url = 'https://www.youtube.com/watch?v=kS-h9cJajOU';
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!);
    const YoutubePlayerFlags(
      autoPlay: false,
    );
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text("Courses"),
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    player,
                    Text(
                      "المهارة السرية لتربية أطفالك",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
          ));
}
