import 'dart:io';

import 'package:coolstuff_market/src/services/upload_image.dart';
import 'package:flutter/material.dart';
import '../../services/select_image.dart';
import 'buildTextField.dart';
import '../../productos_main/dashb.dart';

class NewPostScreen extends StatefulWidget {
  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  File? imagen_to_upload;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Nueva Publicación',
              style: TextStyle(fontSize: 35, color: Colors.blue[900]),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile/mujer1.jpg'), // Reemplazar con la imagen que desees
              radius: 50,
            ),
          ),
          SizedBox(height: 16),
          Center(
              child: Text('María Isabel Gutierrez',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
          Center(
              child: Text('Nueva Publicación en CoolStuff',
                  style: TextStyle(color: Colors.grey))),
          SizedBox(height: 10),
          buildTextField('Título'),
          buildTextField('Precio'),
          buildTextField('Categoría'),
          buildTextField('Estado'),
          buildTextField('Descripción'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {},
                  child: imagen_to_upload != null
                      ? Image.file(imagen_to_upload!)
                      : Container(
                          width: MediaQuery.of(context).size.width - 32,
                          height: 120,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 211, 211, 211),
                            border: Border.all(
                                color: Color.fromRGBO(172, 172, 172, 1)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 45,
                                color: Color.fromRGBO(
                                    30, 144, 255, 1), // Color azul rey
                              ),
                              Text(
                                'Agrega Fotos',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(
                                      30, 144, 255, 1), // Color azul rey
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    final imagen = await getImage();
                    setState(() {
                      imagen_to_upload = File(imagen!.path);
                    });
                  },
                  child: Text('Seleccionar imagen'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 98, 105, 98),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    if (imagen_to_upload == null) {
                      return;
                    }

                    final uploaded = await uploadImage(imagen_to_upload!);
                  },
                  child: Text('Subir imagen'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 98, 105, 98),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const dashb()),
                  );
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción para publicar
                },
                child: Text(
                  'Publicar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
