import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:coolstuff_market/src/features/userScreen/userScreen.dart';
import 'package:coolstuff_market/src/productos_main/dashb.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../../../../../constants/sizes.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("O"),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: Image(
                image: AssetImage(tGoogleLogoImage),
                width: 20.0,
              ),
              onPressed: () {},
              label: Text(tSignInWithGoogle)),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignUpScreen()),
              );
            },
            child: Text.rich(TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text: tSignup, style: TextStyle(color: Colors.blue))
                ]))),
      ],
    );
  }
}
