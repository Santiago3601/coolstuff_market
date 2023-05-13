import 'package:flutter/material.dart';
import 'package:coolstuff_market/src/messages/messages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: ChatList(),
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<User> users = [
    User('Mikel Arroyave', 'assets/images/profile/mujer1.jpg', 'Hola, ¿cómo estás?'),
    User('Sara Ruiz', 'assets/images/profile/mujer2.jpg', '¿Nos vemos mañana?'),
    User('Carlos Torres', 'assets/images/profile/hombre1.jpg', 'Te comparto el enlace...'),
    User('Lucia Sánchez', 'assets/images/profile/mujer3.jpg', 'No te preocupes, lo entiendo'),
    User('Miguel López', 'assets/images/profile/hombre2.jpg', 'Genial, ¡gracias!'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ChatItem(users[index]);
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final User user;

  ChatItem(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(
          user.imageUrl,
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.lastMessage),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessageScreen()),
        );
      },
    );
  }
}

class User {
  final String name;
  final String imageUrl;
  final String lastMessage;

  User(this.name, this.imageUrl, this.lastMessage);
}
