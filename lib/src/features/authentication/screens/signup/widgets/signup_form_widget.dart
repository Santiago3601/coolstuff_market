import 'dart:convert';

import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/sizes.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/dto/user.dart';
import 'package:coolstuff_market/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coolstuff_market/src/utils/toast.dart';
import 'package:http/http.dart' as http;
import 'package:coolstuff_market/src/utils/globals.dart' as globals;
import 'package:intl/intl.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key:_formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller:  controller.fullname,
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller:  controller.phoneNo,
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.phone_android_outlined)),
            ),

            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller:  controller.address,
              decoration: const InputDecoration(
                  label: Text(tAddress),
                  prefixIcon: Icon(Icons.place_outlined)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller:  controller.city,
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
              controller.dob.text = DateFormat('yyyy-MM-dd').format(selectedDate);
            }
          },
        ),


      const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller:  controller.email,
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller:  controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.key),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            const SizedBox(
              height: tFormHeight ,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () async {

                UserApp user = new UserApp.noId(

                    controller.fullname.text.trim(),
                    int.parse(controller.phoneNo.text.trim()),
                    controller.address.text.trim(),
                    controller.city.text.trim(),
                    controller.dob.text.trim(),
                    controller.email.text.trim(),
                    controller.password.text.trim(),
                    "image",""
                );
                final json =   jsonEncode(user);
                print(json);
                var client = http.Client();
                try {
                  var response = await client.post(
                      Uri.parse("https://g20205610b4f23c-n095xjpjzyja68aa.adb.us-ashburn-1.oraclecloudapps.com/ords/cool_stuft_marketplace/user/register"),
                      body: json);
                  print(response.body);
                  globals.userMail=controller.email.text.trim();
                  // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
                  // var uri = Uri.parse(decodedResponse['uri'] as String);
                  // print(await client.get(uri));

                } finally {
                  client.close();
                }

                SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim(), user);







                  // }else{
                  //   flutterToast('Error al crear el usuario, por favor intente mas tarde','error');
                  // }

                  // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());


              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tAccentColor,
                  ),
                  child: Text(tSignup.toUpperCase(),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
