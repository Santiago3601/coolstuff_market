import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Mensajes'),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 2),
            Text('Atrás'),
          ],
        ),
      ),
    );
  }
}