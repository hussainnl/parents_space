import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildChatItem(
            context,
            'Class Chat',
            'Class group chat for all students and teachers.',
            'https://example.com/class_chat_icon.png', // رابط صورة الأيقونة
          ),
          _buildChatItem(
            context,
            'Teacher 1',
            'Chat with Teacher 1',
            'https://example.com/teacher1_icon.png', // رابط صورة الأيقونة
          ),
          _buildChatItem(
            context,
            'Teacher 2',
            'Chat with Teacher 2',
            'https://example.com/teacher2_icon.png', // رابط صورة الأيقونة
          ),
          _buildChatItem(
            context,
            'Teacher 3',
            'Chat with Teacher 3',
            'https://example.com/teacher3_icon.png', // رابط صورة الأيقونة
          ),
          _buildChatItem(
            context,
            'Teacher 4',
            'Chat with Teacher 4',
            'https://example.com/teacher4_icon.png', // رابط صورة الأيقونة
          ),
          _buildChatItem(
            context,
            'Teacher 5',
            'Chat with Teacher 5',
            'https://example.com/teacher5_icon.png', // رابط صورة الأيقونة
          ),
          _buildChatItem(
            context,
            'Customer Service',
            'Chat with Customer Service',
            'https://example.com/customer_service_icon.png', // رابط صورة الأيقونة
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
      BuildContext context, String title, String subtitle, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[700],
        ),
      ),
      onTap: () {
        // انتقال إلى صفحة الشات المحددة
        Get.to(() => ChatDetailScreen(title: title));
      },
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String title;

  const ChatDetailScreen({required this.title, Key? key}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // لعرض الرسائل الأحدث في الأسفل
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.red[700] : Colors.red[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(
                  color: Get.isDarkMode ? Colors.white70 : Colors.black54,
                ),
                filled: true,
                fillColor: Get.isDarkMode ? Colors.black54 : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Get.isDarkMode ? Colors.white : Colors.teal,
            ),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
