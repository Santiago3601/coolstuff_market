import 'dart:io';

import 'package:coolstuff_market/src/services/upload_image.dart';
import 'package:flutter/material.dart';
import '../../services/select_image.dart';
import 'buildTextField.dart';
import '../../productos_main/dashb.dart';
import 'package:get/get.dart';
import '../../features/authentication/controllers/publicar_producto_cont.dart';
import 'package:coolstuff_market/src/dto/producto.dart';

class NewPostScreen extends StatefulWidget {
  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  List<String> categoriasList = ['Electrónicos', 'Ropa', 'Hogar', 'Deportes'];
  List<String> estadosList = ['Nuevo', 'Usado', 'Reacondicionado'];
  File? imagen_to_upload;

  Widget build(BuildContext context) {
    final controller = Get.put(PublicarProducto());
    print('item seleccionado ${controller.categoria}');
    print('item Seleccionado $controller.estado');
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
          buildDropdownTextField('Categoría', categoriasList, (value) {
            setState(() {
              controller.categoria = categoriasList.indexOf(value!) + 1;
            });
            // Hacer algo con el valor seleccionado
          }),
          buildDropdownTextField('Estado', estadosList, (value) {
            setState(() {
              controller.estado = estadosList.indexOf(value!) + 1;
            });
            // Hacer algo con el valor seleccionado
          }),
          buildTextField('Descripción'),
          SizedBox(height: 16),
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
                    //...
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
                onPressed: () async {
                  Producto producto = Producto.noId(
                    controller.titulo.text.trim(),
                    int.parse(controller.precio.text.trim()),
                    controller.categoria,
                    controller.estado,
                    controller.descripcion.text.trim(),
                    1, //ID del vendedor actual
                    "imagen.jpg", // ruta de la imagen seleccionada
                    1, // estado del producto
                  );
                  await controller.publicarProductoApi(producto);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const dashb()),
                  );
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
