import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    _buildCoverImage(context),
                    SizedBox(height: 30),
                  ],
                ),
                Positioned(
                  top: 80,
                  left: MediaQuery.of(context).size.width / 100,
                  child: _buildProfileImage(context),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: _buildProfileName(context)),
            SizedBox(height: 20),
            _buildProfileDetails(context),
            SizedBox(height: 20),
            _buildAchievementsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage(BuildContext context) {
    return Container(
      height: 200,
      child: Image.network(
        'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/398247872_873755687617967_6033557162108741287_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ra5BaHSU3c8Q7kNvgEQ4YGJ&_nc_ht=scontent.fcai20-3.fna&cb_e2o_trans=t&oh=00_AYB8uzdKcl2yPHe3rjNkCcDspdfHyMyDZ-Tv2Ymlxzqf3Q&oe=66565472', // رابط صورة الغلاف
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return CircleAvatar(
      radius: 73,
      backgroundColor: Get.isDarkMode ? Colors.grey[800] : Colors.grey,
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            'https://scontent.fcai20-4.fna.fbcdn.net/v/t39.30808-6/376238128_122110793414026055_9069637272886975608_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGM76H28G692BA9KibR5y4xdO9S6M23Lrd071LozbcutyeRzduwBABjQJtdytNcIbKepM2aimZM6DecjiL5tGBj&_nc_ohc=pwdiNUJKej4Q7kNvgFyfDnl&_nc_ht=scontent.fcai20-4.fna&cb_e2o_trans=t&oh=00_AYA8bQmAUuhjC-Plpzc4-NYulamWv0EXImp24YZjxW5u-g&oe=6653E1B9', // إدخال مسار صورة افتراضي هنا
            // رابط صورة الحساب
          ),
        ),
      ),
    );
  }

  Widget _buildProfileName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe', // اسم المستخدم
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Text(
          'john.doe@example.com', // البريد الإلكتروني للمستخدم
          style: TextStyle(
            fontSize: 16,
            color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Get.isDarkMode ? Colors.black : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          _buildDetailRow(Icons.person, 'Name', 'John Doe'),
          _buildDetailRow(Icons.email, 'Email', 'john.doe@example.com'),
          _buildDetailRow(Icons.phone, 'Phone', '+1234567890'),
          _buildDetailRow(Icons.location_city, 'City', 'New York'),
          _buildDetailRow(Icons.cake, 'Birthday', '01/01/1970'),
          // يمكنك إضافة المزيد من التفاصيل حسب الحاجة
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Get.isDarkMode ? Colors.black : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Parental Achievements',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          _buildAchievementRow(Icons.question_answer, 'Active Inquirer',
              'Frequently asks questions.'),
          _buildAchievementRow(Icons.info, 'Information Provider',
              'Provides a lot of information.'),
          _buildAchievementRow(Icons.share, 'Problem Sharer',
              'Shares their problems with others.'),
          _buildAchievementRow(Icons.comment, 'Active Responder',
              'Responds frequently to others.'),
          _buildAchievementRow(Icons.help, 'Helper', 'Helps others a lot.'),
          // Add more achievements as needed
        ],
      ),
    );
  }

  Widget _buildAchievementRow(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Get.isDarkMode ? Colors.grey[200] : Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
