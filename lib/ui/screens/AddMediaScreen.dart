import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMediaScreen extends StatefulWidget {
  const AddMediaScreen({super.key});

  @override
  _AddMediaScreenState createState() => _AddMediaScreenState();
}

class _AddMediaScreenState extends State<AddMediaScreen> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Media'),
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _videoUrlController,
              decoration: InputDecoration(labelText: 'Video URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String imageUrl = _imageUrlController.text;
                String title = _titleController.text;
                String videoUrl = _videoUrlController.text;
                Navigator.pop(context, {
                  'imageUrl': imageUrl,
                  'title': title,
                  'videoUrl': videoUrl,
                });
              },
              child: Text('Add Media'),
            ),
          ],
        ),
      ),
    );
  }
}
