
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:coolstuff_market/src/features/screens/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:coolstuff_market/src/features/screens/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/sizes.dart';
class ForgetPasswordScreen{

  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        builder: (context) => Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tForgetPasswordTitle,style: Theme.of(context).textTheme.headline2),
              Text(tForgetPasswordSubTitle, style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: tFormHeight),
              ForgetPasswordBtnWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPasswordMailScreen()),
                  );
                },

                title: tEmail,
                subTitle: tResetViaEMail,
                btnIcon: Icons.mail_outline,
              ),
              const SizedBox(height: tFormHeight-20),
              ForgetPasswordBtnWidget(
                onTap: (){},
                title: tPhoneNo,
                subTitle: tResetViaPhone,
                btnIcon: Icons.mobile_friendly_outlined,
              ),
              const SizedBox(height: tFormHeight-20.0),

            ],
          ),
        ));
  }

}

