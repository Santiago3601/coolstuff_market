import 'dart:convert';

import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/constants/sizes.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/authentication/screens/signup/signup_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../authentication/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final controller = Get.put(FadeInAnimationController());
    controller.animationIn();
*/
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                    tag: 'welcome-image-tag',
                    child: Image(
                      image: const AssetImage(tWelcomeScreenImage),
                      height: height * 0.6,
                    )),
                Column(
                  children: [
                    Text(tWelcomeTitle,
                        style: Theme.of(context).textTheme.headline3),
                    Text(tWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        // onPressed: () => Get.to(() => const LoginScreen()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
/*
*

                        onPressed: () async{
                          final json = '[ { "NOMBRE": "Juan Perez2", "TELEFONO": 123, "DIRECCION": "Calle 123", "CIUDAD": "Bogotá", "FECHA_NACIMIENTO": "1990-01-01", "EMAIL": "juan.perez@example.com", "CONTRASENA": "password123", "IMAGEN": "imagen.jpg" } ]';
                          var client = http.Client();
                          try {
                            var response = await client.post(
                                Uri.parse("https://g20205610b4f23c-n095xjpjzyja68aa.adb.us-ashburn-1.oraclecloudapps.com/ords/cool_stuft_marketplace/user/register"),
                                body: json);
                            var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
                            var uri = Uri.parse(decodedResponse['uri'] as String);
                            print(await client.get(uri));

                          } finally {
                            client.close();
                          }
                        }

*
*
* **/
                        child: Text(tLogin.toUpperCase()),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: Text(tSignup.toUpperCase()),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
