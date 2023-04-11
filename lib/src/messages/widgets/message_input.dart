import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Enviar mensaje
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}