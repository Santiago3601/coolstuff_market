
import 'package:coolstuff_market/src/constants/images.dart';
import 'package:coolstuff_market/src/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key  }) : super(key:key);



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(tWelcomeScreenImage), height: size.height * 0.2),
        Text(tLoginTitle, style: Theme.of(context).textTheme.headline3 ),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}