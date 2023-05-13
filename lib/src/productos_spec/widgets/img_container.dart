import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Agregue esta línea
      children: [
        Flexible( // Cambie Expanded por Flexible aquí
          child: Image.asset(
            'assets/images/productos/cafe1.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}