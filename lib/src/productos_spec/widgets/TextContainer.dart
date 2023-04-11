import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Container(
    child: Text(
      'La cafetera de aluminio es un clásico de la preparación del café. Es resistente, duradera y fácil de usar, perfecta para cualquier hogar o establecimiento que desee disfrutar de un café recién hecho. Su diseño de aluminio permite una distribución uniforme del calor, lo que garantiza que el café tenga un sabor rico y auténtico. Además, su construcción robusta asegura una larga vida útil y una limpieza fácil. ¡Haz de tu rutina matutina algo especial con esta cafetera de aluminio!',
      style: TextStyle(
        fontWeight: FontWeight.bold, // establecer negrita
      ),
    ),
  );
}

}