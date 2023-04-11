import 'package:flutter/material.dart';

class SellerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detalles del vendedor',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Agregue esta línea
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/images/profile/mujer1.jpg',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                // Agregue Expanded aquí
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'María Isabela Gutierrez',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Veterana el CoolStuff',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Hola ¿Sigue estando disponible?',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Enviar mensaje'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 2, 59, 105)), // establecer el color de fondo
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
