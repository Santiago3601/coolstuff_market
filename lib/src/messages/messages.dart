import 'package:flutter/material.dart';
import 'widgets/message_input.dart';
import 'widgets/message_list.dart';
import 'widgets/custom_app_bar.dart';


class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MessageList(),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}