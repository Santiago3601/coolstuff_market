import 'package:flutter/material.dart';
import 'NotificationCard.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationItem> notifications;

  NotificationsList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
        return NotificationCard(notification: notifications[index], index: index);
      },
    );
  }
}