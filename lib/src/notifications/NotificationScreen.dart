import 'package:flutter/material.dart';
import 'widgets/NotificationCard.dart';
import 'widgets/NotificationList.dart';
import 'widgets/AppBar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
        title: '5 personas',
        description: 'Están viendo tu publicación',
        imagePath: 'assets/images/productos/cafe1.png'), // Cambiar ruta de la imagen aquí
    NotificationItem(
        title: '10 personas',
        description: 'Están interesadas en contactarte para obtener más información sobre este producto',
        imagePath: 'assets/images/productos/cafe2.jpg'), // Cambiar ruta de la imagen aquí
    NotificationItem(
        title: '¿Aún estás vendiendo este producto?',
        description: 'Verifica si aún estás vendiendo este producto para mantenerlo al día',
        imagePath: 'assets/images/productos/saco1.jpg'), // Cambiar ruta de la imagen aquí
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(notificationCount: notifications.length),
      body: NotificationsList(notifications: notifications),
    );
  }
}
