import 'package:flutter/material.dart';
import 'package:techme/utils/colors.dart';
import 'package:techme/widgets/small_text.dart';

class Button extends StatelessWidget {
  final String text;

  Button({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      child: Center(
          child: SmallText(
        text: text,
        size: 17,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      )),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.buttonBgColor),
    );
  }
}
