import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/sizes.dart';
import '../../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  //prefixIcon: Icon(Icons.person_3_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: UnderlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
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
                  onPressed: () {},
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


