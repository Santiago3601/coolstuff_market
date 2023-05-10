import 'package:flutter/material.dart';
import 'dart:io';
import '../../services/select_image.dart';
import '../../services/upload_image.dart';

class EditUser extends StatefulWidget {

  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(
              'Editar perfil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campo 1',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campo 2',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campo 3',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campo 4',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campo 5',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Campo 6',
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
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

                    if (uploaded) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Imagen subida correctamente"),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Error al subir la imagen"),
                      ));
                    }
                  },
                  child: Text('Subir imagen'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 98, 105, 98),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {
                  // acción a realizar cuando se presiona el botón
                },
                child: Text(
                  'Guardar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      )));
  }
}