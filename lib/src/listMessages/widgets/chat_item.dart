import 'package:coolstuff_market/src/messages/messages.dart';
import 'package:flutter/material.dart';


class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(
          '/assets/images/profile/mujer2.jpg', // Cambia esta URL por la de la imagen de perfil deseada
        ),
      ),
      title: Text('Mikel Arroyave'),
      subtitle: Text('Último mensaje...'),
      onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageScreen()),
              );
            },
    );
  }
}