import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final int index;

  NotificationCard({required this.notification, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Notificación ${index + 1} clickeada');
      },
      child: Card(
        child: ListTile(
          leading: Image.asset(notification.imagePath, width: 40, height: 40),
          title: Text(notification.title),
          subtitle: Text(notification.description),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final String imagePath;

  NotificationItem({required this.title, required this.description, required this.imagePath});
}





