import 'package:get/get.dart';

class PostController extends GetxController {
  var postList = [].obs;

  void addTask({
    required String name,
    required String imagePath,
    required String content,
    required DateTime date,
    required String category,
  }) {
    var newPost = {
      'name': name,
      'imagePath': imagePath,
      'content': content,
      'date': date,
      'category': category,
    };
    postList.add(newPost);
  }

  void deleteTask(int index) {
    postList.removeAt(index);
  }
}
