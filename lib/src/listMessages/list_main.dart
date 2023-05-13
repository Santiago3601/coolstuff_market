import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/search_bar.dart';
import 'widgets/chat_item.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<User> users = [
    User('Mikel Arroyave', 'assets/images/profile/mujer1.jpg', 'Hola, ¿cómo estás?'),
    User('Sara Ruiz', 'assets/images/profile/mujer2.jpg', '¿Nos vemos mañana?'),
    User('Carlos Torres', 'assets/images/profile/hombre1.jpg', 'Te comparto el enlace...'),
    User('Lucia Sánchez', 'assets/images/profile/mujer3.jpg', 'No te preocupes, lo entiendo'),
    User('Miguel López', 'assets/images/profile/hombre2.jpg', 'Genial, ¡gracias!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ChatItem(users[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
