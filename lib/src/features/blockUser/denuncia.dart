// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class Denunciar extends StatelessWidget {
  const Denunciar({super.key});

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
                onPressed: null,
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return Icon(Icons.attach_file);
                    }),
                    SizedBox(width: 8),
                    Text('Agregar archivo'),
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
                onPressed: null,
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
