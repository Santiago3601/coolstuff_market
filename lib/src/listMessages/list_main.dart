import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/search_bar.dart';
import 'widgets/chat_item.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}