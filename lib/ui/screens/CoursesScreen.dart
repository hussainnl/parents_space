import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_space_new/ui/screens/AddMediaScreen.dart';
import 'package:parent_space_new/ui/screens/VideoScreen.dart';

class MediaController extends GetxController {
  var mediaList = <Map<String, String>>[].obs;

  void addMedia(Map<String, String> media) {
    mediaList.add(media);
  }
}

class CoursesScreen extends StatelessWidget {
  final MediaController mediaController = Get.put(MediaController());

  CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.to(() => AddMediaScreen());
          if (result != null) {
            mediaController.addMedia(result);
          }
        },
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: mediaController.mediaList.length,
          itemBuilder: (context, index) {
            final mediaItem = mediaController.mediaList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => VideoScreen(
                    videoUrl: mediaItem['videoUrl']!,
                    relatedVideos: mediaController.mediaList.toList()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Colors.black.withOpacity(.1)
                      : Colors.white,
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
                    Image.network(mediaItem['imageUrl']!),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                      child: Text(
                        mediaItem['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
