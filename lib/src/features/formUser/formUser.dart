import 'package:coolstuff_market/src/dto/imageUploadState.dart';
import 'package:coolstuff_market/src/dto/user.dart';
import 'package:coolstuff_market/src/features/authentication/controllers/profile_update_controller.dart';
import 'package:coolstuff_market/src/features/userScreen/userScreen.dart';
import 'package:coolstuff_market/src/services/select_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:coolstuff_market/src/utils/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/sizes.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/authentication/controllers/signup_controller.dart';
import 'dart:io';
import '../../services/upload_image.dart';
import '../../utils/themes/theme.dart';
import 'package:intl/intl.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUser();
}

class _EditUser extends State<EditUser> {
  File? imagen_to_upload;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileUpdateController());
    controller.fullname.text = globals.ownUser.nombre().toString();
    controller.address.text = globals.ownUser.direccion().toString();
    controller.city.text = globals.ownUser.ciudad().toString();
    controller.dob.text = globals.ownUser.fecha_nacimiento().toString();
    controller.email.text = globals.userMail;
    controller.photo.text = globals.ownUser.imagen().toString();
    controller.phoneNo.text = globals.ownUser.telefono().toString();
    if (true) {}
    return MaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: Scaffold(
            body: Form(
                child: Builder(
                    builder: (context) => SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: tFormHeight - 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: tFormHeight + 60,
                            ),
                            Text(tUpdateProfileHeader,
                                style: Theme.of(context).textTheme.headline3),
                            const SizedBox(
                              height: tFormHeight + 60,
                            ),
                            TextFormField(
                              controller: controller.fullname,
                              decoration: const InputDecoration(
                                  label: Text(tFullName),
                                  prefixIcon: Icon(Icons.person_outline)),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: controller.phoneNo,
                              decoration: const InputDecoration(
                                  label: Text(tPhoneNo),
                                  prefixIcon:
                                      Icon(Icons.phone_android_outlined)),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: controller.address,
                              decoration: const InputDecoration(
                                  label: Text(tAddress),
                                  prefixIcon: Icon(Icons.place_outlined)),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: controller.city,
                              decoration: const InputDecoration(
                                  label: Text(tCity),
                                  prefixIcon: Icon(Icons.place_outlined)),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: controller.dob,
                              decoration: const InputDecoration(
                                label: Text(tDOB),
                                prefixIcon: Icon(Icons.calendar_today_outlined),
                              ),
                              readOnly: true,
                              onTap: () async {
                                // Show the date picker and get the selected date
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );

                                // Update the date text field if the user selected a date
                                if (selectedDate != null) {
                                  controller.dob.text = DateFormat('yyyy-MM-dd')
                                      .format(selectedDate);
                                }
                              },
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            TextFormField(
                              controller: controller.email,
                              enabled: false,
                              decoration: const InputDecoration(
                                  label: Text(tEmail),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            const SizedBox(
                              height: tFormHeight - 20,
                            ),
                            Visibility(
                                visible: false,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    label: Text(tPassword),
                                    prefixIcon: Icon(Icons.key),
                                    suffixIcon:
                                        Icon(Icons.remove_red_eye_outlined),
                                  ),
                                )),
                            const SizedBox(
                              height: tFormHeight,
                            ),
                            TextFormField(
                              controller: controller.comment,
                              enabled: true,
                              decoration: const InputDecoration(
                                label: Text(tComment),
                                // prefixIcon: Icon(Icons.email_outlined)
                              ),
                            ),
                            const SizedBox(
                              height: tFormHeight,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  var uploaded = new ImageUploadState(false, controller.photo.text.trim());
                                  String imagePathToUpload;
                                  //Subida de imagen
                                  if (imagen_to_upload != null) {
                                    uploaded = await uploadImage(imagen_to_upload!);
                                    if (uploaded.state()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text("Imagen subida correctamente"),
                                      ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text("Error al subir la imagen"),
                                      ));
                                    }
                                    print("The path is: " + uploaded.path());
                                    imagePathToUpload = tstartPathFirestorage+uploaded.path()+tendPathFirestorage;
                                  }else{
                                    imagePathToUpload=controller.photo.text.trim();
                                    print(imagePathToUpload);
                                  }
                                  //Actualización de usuario
                                  UserApp user = new UserApp.noMailOrPassword(
                                      globals.ownUser.id(),
                                      controller.fullname.text.trim(),
                                      int.parse(controller.phoneNo.text.trim()),
                                      controller.address.text.trim(),
                                      controller.city.text.trim(),
                                      controller.dob.text.trim(),
                                      imagePathToUpload,
                                      controller.comment.text.trim());
                                  final json = jsonEncode(user);
                                  print(json);
                                  var client = http.Client();
                                  var response;
                                  try {
                                    response = await client.post(Uri.parse("https://g20205610b4f23c-n095xjpjzyja68aa.adb.us-ashburn-1.oraclecloudapps.com/ords/cool_stuft_marketplace/user/update"), body: json);
                                    print(response.body);
                                    print(response.statusCode);
                                    print(globals.ownUser.id());
                                  } finally {
                                    client.close();
                                  }
                                  if(response.statusCode==200){
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Información actualizada correctamente."),));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("Error al subir la información intente otra vez, mas tarde."),));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tAccentColor,
                                ),
                                child: Text(tUpdate.toUpperCase()),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: imagen_to_upload != null
                                        ? Image.file(imagen_to_upload!)
                                        : Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                32,
                                            height: 120,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 211, 211, 211),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      172, 172, 172, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.camera_alt,
                                                  size: 45,
                                                  color: Color.fromRGBO(30, 144,
                                                      255, 1), // Color azul rey
                                                ),
                                                Text(
                                                  'Agrega Fotos',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        30,
                                                        144,
                                                        255,
                                                        1), // Color azul rey
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
                          ],
                        ))))));
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
