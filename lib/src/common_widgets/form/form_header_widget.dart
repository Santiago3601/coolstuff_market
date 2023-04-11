import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  FormHeaderWidget(
      {Key? key,
      required this.image,
      this.imageColor,
      this.heightBetween,
      required this.title,
      required this.subTitle,
      this.imageHeight =0.2,
      this.crossAxisAligment = CrossAxisAlignment.start,
      this.textAlign
      })
      : super(key: key);

  final String image, title, subTitle;
  final Color? imageColor;
  final double? heightBetween;
  final TextAlign? textAlign;
  final double imageHeight;
  final CrossAxisAlignment crossAxisAligment;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAligment,
      children: [
        Image(image: AssetImage(image), height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headline3),
        Text(subTitle, textAlign :textAlign,style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
