import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../publish/publish_main.dart';
import '../notifications/NotificationScreen.dart';
import '../features/userScreen/userScreen.dart';
import '../listMessages/list_main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dehaze,
            color: Color.fromARGB(255, 0, 48, 136),
            size: 30,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            child: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => publish_main()),
              );
            },
            child: Icon(
              Icons.add_box,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 50,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatListScreen()),
              );
            },
            child: Icon(
              Icons.chat_bubble,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            },
            child: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
