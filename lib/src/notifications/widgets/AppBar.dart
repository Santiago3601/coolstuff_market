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
          Icon(Icons.notifications),
          SizedBox(width: 8),
          Text('$notificationCount Notificaciones'),
        ],
      ),
    );
  }
}

