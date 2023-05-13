import 'dart:convert';

import 'package:coolstuff_market/src/dto/user.dart';
import 'package:coolstuff_market/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../publish/publish_main.dart';
import '../notifications/NotificationScreen.dart';
import '../features/userScreen/userScreen.dart';
import '../listMessages/list_main.dart';
import 'package:http/http.dart' as http;
import 'package:coolstuff_market/src/utils/globals.dart' as globals;

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items: [
        
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            child: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => publish_main()),
              );
            },
            child: Icon(
              Icons.add_box,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatListScreen()),
              );
            },
            child: Icon(
              Icons.chat_bubble,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () async{
              var client = http.Client();
              try {
                var response = await client.get(
                    Uri.parse("https://g20205610b4f23c-n095xjpjzyja68aa.adb.us-ashburn-1.oraclecloudapps.com/ords/cool_stuft_marketplace/user/get-by-email/" +globals.userMail));
                var jsonResponse = jsonDecode(response.body.replaceAll("[", "").replaceAll("]", ""));
                globals.ownUser = UserApp.fromJson(jsonResponse);
                globals.myOwnProfile = true;

                 print(globals.ownUser);
                // UserApp user = jsonDecode(response.body.replaceAll("[", "").replaceAll("]", ""));
                // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
                // var uri = Uri.parse(decodedResponse['uri'] as String);
                // print(await client.get(uri));

              } finally {
                client.close();
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            },
            child: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 48, 136),
              size: 30,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
