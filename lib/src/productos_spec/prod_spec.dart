import 'package:flutter/material.dart';
import 'widgets/img_container.dart';
import 'widgets/localization_details.dart';
import 'widgets/seller_details.dart';
import 'widgets/txt_campo.dart';
import 'widgets/TextContainer.dart';

class prod_spec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      title: Image.asset('assets/images/cool_stuff_light.png', height: 100),
      elevation: 0,
    ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              
              children: [
                ImageContainer(),
                Padding(
                  padding: EdgeInsets.only(left:10,right:10),
                  child: TextFormFieldContainer(),
                ),
                Container(
                  width: 400.0, // establecer ancho
                  height: 20.0, // establecer altura
                  color: Color.fromARGB(255, 255, 255, 255), // color de fondo
                ),
                TextContainer(),
                 Container(
                  width: 400.0, // establecer ancho
                  height: 20.0, // establecer altura
                  color: Color.fromARGB(255, 255, 255, 255), // color de fondo
                ),
                SellerDetails(),
                //SellerLocation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
