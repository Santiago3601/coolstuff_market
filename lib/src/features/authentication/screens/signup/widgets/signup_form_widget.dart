import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/sizes.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
              controller:  controller.dob,
              decoration: const InputDecoration(
                  label: Text(tDOB),
                  prefixIcon: Icon(Icons.calendar_today_outlined)),
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
              child: ElevatedButton(onPressed: () {
                if(_formKey.currentState!.validate()){
                  SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                }

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
