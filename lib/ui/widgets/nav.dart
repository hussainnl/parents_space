import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_space_new/services/theme_services.dart';
import 'package:parent_space_new/ui/screens/AccountScreen.dart';
import 'package:parent_space_new/ui/screens/ChatScreen.dart';
import 'package:parent_space_new/ui/screens/CoursesScreen.dart';
import 'package:parent_space_new/ui/screens/HomeSceern.dart';

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
      _controller.forward(from: 0.0);
    });
  }

  bool isDarkMode = false;
  bool isLoading = false;

  Future<void> _switchTheme() async {
    await ThemeServices().switchTheme(); // Ensure this is awaited
    setState(() {
      isDarkMode = !isDarkMode;
      isLoading = true;
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> appBarTitles = ['Home', 'Chats', 'Courses', 'My Account'];

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[currentPageIndex]),
        elevation: 1,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: _switchTheme,
          icon: Icon(Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : <Widget>[
              const HomeScreen(),
              const ChatScreen(),
              CoursesScreen(),
              const AccountScreen()
            ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height * .08,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        indicatorColor: Get.isDarkMode ? Colors.grey : Colors.black87,
        shadowColor: Colors.white,
        elevation: 1,
        onDestinationSelected: _onItemTapped,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.chat,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
            icon: const Icon(Icons.chat_outlined),
            label: 'Chats',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.description,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
            icon: const Icon(Icons.description_outlined),
            label: 'Courses',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
            icon: const Icon(Icons.person_outline),
            label: 'My Account',
          ),
        ],
        surfaceTintColor: Colors.amber,
      ),
    );
  }
}
