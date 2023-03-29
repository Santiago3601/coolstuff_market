import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants/sizes.dart';
import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              LoginHeaderWidget(),
              LoginForm(),
              LoginFooterWidget()
            ],
          )),
    ));
  }
}
