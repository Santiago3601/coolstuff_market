// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use
import 'dart:io';
import 'package:coolstuff_market/src/features/blockUser/services/select_image.dart';
import 'package:coolstuff_market/src/features/blockUser/services/upload_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:coolstuff_market/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(Denunciar());
}

class Denunciar extends StatefulWidget {
  const Denunciar({super.key});

  @override
  State<Denunciar> createState() => _Denunciar();
}

class _Denunciar extends State<Denunciar> {
  File? imagen_to_upload;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('CoolStuff Market'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Denunciar Vendedor',
                style: TextStyle(
                  color: Color.fromARGB(255, 32, 100, 155),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Por favor, proporcione una descripción detallada de la infracción cometida por el vendedor.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Escriba su denuncia aquí',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final imagen = await getImage();
                  setState(() {
                    imagen_to_upload = File(imagen!.path);
                  });
                },
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return Icon(Icons.attach_file);
                    }),
                    SizedBox(width: 8),
                    Text('Seleccionar archivo'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (imagen_to_upload == null) {
                    return;
                  }
                  final uploaded = await uploadImage(imagen_to_upload!);

                  if (uploaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Archivo subido.")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Error en subida de archivo.")));
                  }
                },
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return Icon(Icons.upload_file);
                    }),
                    SizedBox(width: 8),
                    Text('Subir archivo'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'En un plazo de 24 horas, un agente se comunicara contigo informandole el proceso a seguir, lamentamos los inconvenientes que esta situacion haya podido generar. ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return Icon(Icons.block);
                    }),
                    SizedBox(width: 25),
                    Expanded(
                      child: Text(
                        'DENUNCIAR VENDEDOR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
