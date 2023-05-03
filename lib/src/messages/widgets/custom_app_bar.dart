import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Mensajes', style: TextStyle(color: Color.fromARGB(255, 2, 59, 105))),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(Icons.arrow_back, color: Color.fromARGB(255, 2, 59, 105),),
            SizedBox(width: 2),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}