import 'package:coolstuff_market/src/common_widgets/form/form_header_widget.dart';
import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/constants/text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/sizes.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(children: [
              SizedBox(height: tFormHeight * 4),
              FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tForgetPassword,
                  subTitle: tForgetPasswordSubTitle,
                  crossAxisAligment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center),
              const SizedBox(height: tFormHeight),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tEmail),
                          hintText: tEmail,
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {}, child: Text(tNext)),
                    ),
                  ],
                ),
              )
            ]

                // const SizedBox(height: tFormHeight - 20),

                ),
          ),
        ),
      ),
    );
  }
}
