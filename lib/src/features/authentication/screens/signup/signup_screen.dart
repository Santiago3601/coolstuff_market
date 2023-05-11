import 'package:coolstuff_market/src/common_widgets/form/form_header_widget.dart';
import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/constants/sizes.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderWidget(
              image: tWelcomeScreenImage,
              title: tSignUpTitle,
              subTitle: tSignUpSubTitle,
            ),
            SignUpFormWidget(),
            Column(
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
                    onPressed: () {},
                    child: Text.rich(TextSpan(
                        text: tAlreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyText1,
                        children: const [
                          TextSpan(
                              text: tSignup,
                              style: TextStyle(color: Colors.blue))
                        ])))
              ],
            )

            // LoginForm(),
            // LoginFooterWidget(),
          ],
        ),
      ))),
    );
  }
}
