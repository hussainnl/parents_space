import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  final List<Map<String, String>> relatedVideos;
  const VideoScreen(
      {super.key, required this.videoUrl, required this.relatedVideos});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: Text('YouTube Player'),
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
        body: ListView(
          children: [
            _buildVideoCard(player),
            const SizedBox(height: 20),
            _buildRelatedVideosSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoCard(Widget player) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black54 : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Get.isDarkMode ? Colors.black12 : Colors.black26,
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          player,
          const SizedBox(height: 10),
          Text(
            'Video Title',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'This is a description of the video. It can be a few sentences long, providing some details about the content of the video.',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                color: Colors.blue,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                color: Colors.green,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.purple,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedVideosSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Related Videos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          _buildRelatedVideos(),
        ],
      ),
    );
  }

  Widget _buildRelatedVideos() {
    return Column(
      children: widget.relatedVideos.map((video) {
        return GestureDetector(
          onTap: () {
            if (video['videoUrl'] != null) {
              Get.to(() => VideoScreen(
                  videoUrl: video['videoUrl']!,
                  relatedVideos: widget.relatedVideos));
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black54 : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Get.isDarkMode ? Colors.black12 : Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              children: [
                if (video['thumbnail'] != null)
                  Image.network(video['thumbnail']!, width: 100, height: 100)
                else
                  Container(width: 100, height: 100, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    video['title'] ?? 'No Title',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
