import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'package:parent_space_new/ui/them.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: PrimaryClr,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // إضافة المنطق اللازم لإعادة تعيين كلمة المرور هنا
                    Get.to(() => LoginScreen());
                  },
                  child: Text('Reset Password'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryClr,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text(
                    'Remembered your password? Login',
                    style: TextStyle(
                      color: PrimaryClr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
