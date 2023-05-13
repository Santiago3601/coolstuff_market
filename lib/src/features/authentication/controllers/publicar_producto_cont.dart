import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:coolstuff_market/src/dto/producto.dart';
import 'package:http/http.dart' as http;

class PublicarProducto extends GetxController {
  
  TextEditingController titulo = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  int categoria = 0;
  int estado = 0;

  // enviar el producto al servidor 
  Future<void> publicarProductoApi(Producto producto) async {
    
    final url = 'https://g20205610b4f23c-n095xjpjzyja68aa.adb.us-ashburn-1.oraclecloudapps.com/ords/cool_stuft_marketplace/products/';

    // Convertir el objeto Producto a un mapa 
    final productoJson = producto.toJson();

    //solicitud HTTP POST
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productoJson),
    );

    
    if (response.statusCode == 200) {
      // La solicitud fue exitosa
    } else {
      // La solicitud falló
      throw Exception('Error al publicar el producto');
    }
  }
}
