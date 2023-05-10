import 'package:coolstuff_market/src/dto/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/features/userScreen/userScreen.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import '../blockUser/denuncia.dart';
import 'package:coolstuff_market/src/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;

import '../formUser/formUser.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (true) {}
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
                padding: EdgeInsets.all(
                    10), // Ajusta el valor del padding según sea necesario
                child: FutureBuilder<String>(
                  future: validateImage(userToShow().imagen().toString()),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(999.0),
                            child: Image.network(
                              snapshot.data!,
                              width: 200,
                                height: 200
                            ));
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              userToShow().nombre().toString(),
              style: TextStyle(fontSize: 22),
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
                              userToShow().nombre().toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          userToShow().comentario().toString(),
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
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Denunciar()),
                    );
                  },
                  child: Text('Denunciar'),
                  style: ElevatedButton.styleFrom(primary: Colors.red)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditUser()),
                    );
                  },
                  child: Text('Editar perfil'),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 198, 219, 6))),
            ),
          ),
        ])));
  }

  UserApp userToShow() {
    if (globals.myOwnProfile) {
      return globals.ownUser;
    } else {
      return globals.ownUser;
    }
  }

  Future<String> validateImage(String imageUrl) async {
    print(imageUrl);
    http.Response res;
    try {
      res = await http.get(Uri.parse(imageUrl));
    } catch (e) {
      return "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    }
    if (res.statusCode != 200)
      return "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    Map<String, dynamic> data = res.headers;
    if (checkIfImage(data['content-type'])) {
      return imageUrl;
    } else {
      return "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    }
  }

  bool checkIfImage(String param) {
    if (param == 'image/jpeg' || param == 'image/png' || param == 'image/gif') {
      return true;
    }
    return false;
  }
}
