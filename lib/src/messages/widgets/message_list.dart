
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Bubble(
          margin: BubbleEdges.only(top: 10),
          alignment: index % 2 == 0
              ? Alignment.topLeft
              : Alignment.topRight,
          child: Text(
            'Mensaje ${index + 1}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          color: index % 2 == 0
              ? Colors.grey.shade300
              : Theme.of(context).primaryColor,
        );
      },
    );
  }
}
