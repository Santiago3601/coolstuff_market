import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/features/userScreen/userScreen.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Screen'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10), // Ajusta el valor del padding según sea necesario
                child: Image(
                  image: AssetImage(tUserIcon),
                  width: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Nombre de usuario',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: SizedBox(
              width: 180,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para compartir
                },
                child: Text('Compartir'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Calificación del vendedor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(tEstrellaIcon),
                  width: 40,
                ),
                Image(
                  image: AssetImage(tEstrellaIcon),
                  width: 40,
                ),
                Image(
                  image: AssetImage(tEstrellaIcon),
                  width: 40,
                ),
                Image(
                  image: AssetImage(tEstrellaIcon),
                  width: 40,
                ),
                Image(
                  image: AssetImage(tEstrellaIcon),
                  width: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Comentarios',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(tUserIcon),
                  width: 40,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nombre Usuario',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Último comentario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.alphaBlend(
                                      Color.fromARGB(255, 8, 118, 209),
                                      Color.fromARGB(255, 179, 176, 176)),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 350,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para compartir
                },
                child: Text('Visualizar más comentarios'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Acerca del Usuario',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(tWppIcon),
                  width: 50,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nombre Usuario',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para compartir
                },
                child: Text('Agregar mi número'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Establecer el color de fondo a verde
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(tProductoIcon),
                  width: 100,
                ),
                Image(
                  image: AssetImage(tProductoIcon),
                  width: 100,
                ),
                Image(
                  image: AssetImage(tProductoIcon),
                  width: 100,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para compartir
                },
                child: Text('Ver más productos'),
              ),
            ),
          )
        ])));
  }
}
