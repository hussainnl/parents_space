import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_space_new/controllers/post_controller.dart';
import 'package:parent_space_new/ui/them.dart';
import 'package:parent_space_new/ui/widgets/buttom.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final PostController _postController = Get.put(PostController());
  final TextEditingController _titleController = TextEditingController();
  String _selectedCategory = 'Question'; // Default category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: PrimaryClr,
          ),
        ),
        title: Text(
          'Add Post',
          style: TextStyle(color: PrimaryClr),
        ),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://scontent.fcai20-4.fna.fbcdn.net/v/t39.30808-6/376238128_122110793414026055_9069637272886975608_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGM76H28G692BA9KibR5y4xdO9S6M23Lrd071LozbcutyeRzduwBABjQJtdytNcIbKepM2aimZM6DecjiL5tGBj&_nc_ohc=pwdiNUJKej4Q7kNvgFyfDnl&_nc_ht=scontent.fcai20-4.fna&cb_e2o_trans=t&oh=00_AYA8bQmAUuhjC-Plpzc4-NYulamWv0EXImp24YZjxW5u-g&oe=6653E1B9', // إدخال مسار صورة افتراضي هنا
            ),
            radius: 18,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What would you like to share?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10.0,
                children: [
                  ChoiceChip(
                    label: Text('Question'),
                    selected: _selectedCategory == 'Question',
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCategory = 'Question';
                      });
                    },
                    selectedColor: Colors.blueAccent,
                    backgroundColor:
                        Get.isDarkMode ? Colors.blue[900] : Colors.blue[100],
                  ),
                  ChoiceChip(
                    label: Text('Advice'),
                    selected: _selectedCategory == 'Advice',
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCategory = 'Advice';
                      });
                    },
                    selectedColor: Colors.greenAccent,
                    backgroundColor:
                        Get.isDarkMode ? Colors.green[900] : Colors.green[100],
                  ),
                  ChoiceChip(
                    label: Text('Problem'),
                    selected: _selectedCategory == 'Problem',
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCategory = 'Problem';
                      });
                    },
                    selectedColor: Colors.redAccent,
                    backgroundColor:
                        Get.isDarkMode ? Colors.red[900] : Colors.red[100],
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                maxLines: 10,
                controller: _titleController,
                style: subTitleStyle,
                cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                decoration: InputDecoration(
                  hintText: _selectedCategory == 'Question'
                      ? 'What is your question?'
                      : _selectedCategory == 'Advice'
                          ? 'What is your advice?'
                          : _selectedCategory == 'Problem'
                              ? 'What is your problem?'
                              : 'Share something...',
                  hintStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white54 : Colors.black54),
                  filled: true,
                  fillColor: Get.isDarkMode ? Colors.black54 : Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // يمكن إضافة وظيفة لإضافة صورة أو فيديو
                    },
                    icon: Icon(Icons.add_photo_alternate),
                    label: Text('Add Photo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryClr,
                    ),
                  ),
                  MyButton(
                    label: 'Post',
                    onTap: () {
                      if (_titleController.text.trim().isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Post content cannot be empty.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else {
                        DateTime _selectedDate = DateTime.now();

                        _postController.addTask(
                          name: 'Default Name', // إدخال اسم افتراضي هنا
                          imagePath:
                              'https://scontent.fcai20-4.fna.fbcdn.net/v/t39.30808-6/376238128_122110793414026055_9069637272886975608_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGM76H28G692BA9KibR5y4xdO9S6M23Lrd071LozbcutyeRzduwBABjQJtdytNcIbKepM2aimZM6DecjiL5tGBj&_nc_ohc=pwdiNUJKej4Q7kNvgFyfDnl&_nc_ht=scontent.fcai20-4.fna&cb_e2o_trans=t&oh=00_AYA8bQmAUuhjC-Plpzc4-NYulamWv0EXImp24YZjxW5u-g&oe=6653E1B9', // إدخال مسار صورة افتراضي هنا
                          content: _titleController.text,
                          category: _selectedCategory,
                          date: _selectedDate,
                        );
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
