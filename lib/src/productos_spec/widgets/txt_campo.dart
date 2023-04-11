import 'package:flutter/material.dart';

class TextFormFieldContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Text(
              'CAFETERA DE ALUMINIO',
              style: TextStyle(
                fontWeight: FontWeight.bold, // negrita
                fontSize: 24.0, // tamaño de fuente
              ),
            ),
          ),
          Expanded(
            child: Text(
              '75.000 COP',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.grey)
            ),
          ),
        ],
      ),
    );
  }
}
