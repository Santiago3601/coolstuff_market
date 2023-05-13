import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/authentication/controllers/login_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../constants/sizes.dart';
import 'package:coolstuff_market/src/utils/globals.dart' as globals;
import '../../../controllers/signup_controller.dart';
import '../../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller:  controller.email,
              decoration: const InputDecoration(
                  //prefixIcon: Icon(Icons.person_3_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: UnderlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller:  controller.password,
              decoration: const InputDecoration(
                  //prefixIcon: Icon(Icons.password_outlined),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye))),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: Text(tForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    globals.userMail=controller.email.text.trim();
                    LoginController.instance.loginWithEmailAndPassword(controller.email.text.trim(), controller.password.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tAccentColor,
                  ),
                  child: Text(
                    tLogin.toUpperCase(),
                  )),
            )
          ],
        ),
      ),
    );
  }


}


