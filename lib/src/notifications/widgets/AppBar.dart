import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;

  CustomAppBar({required this.notificationCount});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.notifications, color: Color.fromARGB(255, 2, 59, 105),),
          SizedBox(width: 8),
          Text('$notificationCount Notificaciones',style: TextStyle(color: Color.fromARGB(255, 2, 59, 105)),),
          
        ],
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 2, 59, 105)),
    );
  }
}

