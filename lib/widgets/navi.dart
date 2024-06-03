import 'package:flutter/material.dart';
import 'package:parent_space_new/Screens/account.dart';
import 'package:parent_space_new/Screens/chat.dart';
import 'package:parent_space_new/Screens/course.dart';
import 'package:parent_space_new/Screens/home.dart';

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

int currentPageIndex = 0;

class _NaviState extends State<Navi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: MediaQuery.of(context).size.height * .100,
        backgroundColor: Colors.teal,
        indicatorColor: Colors.teal[200],
        shadowColor: Colors.white,
        elevation: 0,
        overlayColor: MaterialStatePropertyAll(Colors.teal),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
            ),
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.chat),
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.description),
            icon: Icon(Icons.description_outlined),
            label: 'Courses',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'My Account',
          ),
        ],
        surfaceTintColor: Colors.amber,
      ),
      body: <Widget>[Home(), Chat(), Course(), Account()][currentPageIndex],
    );
  }
}
