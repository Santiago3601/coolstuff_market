import 'package:coolstuff_market/src/constants/colors.dart';
import 'package:coolstuff_market/src/constants/sizes.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.phone_android_outlined)),
            ),

            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tAddress),
                  prefixIcon: Icon(Icons.place_outlined)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tCity),
                  prefixIcon: Icon(Icons.place_outlined)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tDOB),
                  prefixIcon: Icon(Icons.calendar_today_outlined)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
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
              child: ElevatedButton(onPressed: () {},
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
