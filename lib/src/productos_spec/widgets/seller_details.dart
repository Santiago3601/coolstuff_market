import 'dart:convert';

import 'package:coolstuff_market/src/features/userScreen/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:coolstuff_market/src/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:coolstuff_market/src/dto/user.dart';

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

                      onPressed: () async {
                        globals.myOwnProfile = false;
                        //TODO:
                        //Aquí se debe asignar el ID Del vendedor que se quiere consultar los datos, no debe estar quemado
                        globals.userId = 115;
                        var client = http.Client();
                        try {
                          var response = await client.get(Uri.parse(
                              "https://g20205610b4f23c-n095xjpjzyja68aa.adb.us-ashburn-1.oraclecloudapps.com/ords/cool_stuft_marketplace/user/get-by-id/" + globals.userId.toString()));
                          print( globals.userMail);
                          print(response.body.replaceAll("\n", ""));
                          var jsonResponse = jsonDecode(
                              response.body.replaceAll("[", "").replaceAll("]", ""));
                          globals.user = UserApp.fromJson(jsonResponse);
                          print(globals.user);
                          print(globals.user.nombre());
                          print(globals.user.telefono());
                          print(globals.user.fecha_nacimiento());
                          print(globals.user.direccion());
                          print(globals.user.ciudad());
                          print(globals.user.imagen());
                          print(globals.user.email());
                          print(globals.user.comentario());

                          // UserApp user = jsonDecode(response.body.replaceAll("[", "").replaceAll("]", ""));
                          // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
                          // var uri = Uri.parse(decodedResponse['uri'] as String);
                          // print(await client.get(uri));
                        } finally {
                          client.close();
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserScreen()),
                        );

                      },
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
