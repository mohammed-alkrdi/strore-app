import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_products/widgets/text_input.dart';

import '../const/app_colors.dart';

class RoundedButton extends StatelessWidget {
  TextInput textInput;
  final Color color1;
  final Color color2;
  final double sizeHeight;
  final double sizeWidth;
  final void Function() onPressed;

  RoundedButton(
      {Key? key,
      //required this.backColor,
      required this.sizeHeight,
      required this.onPressed,
      required this.textInput,
      required this.color1,
      required this.color2,
      required this.sizeWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight,
      width: sizeWidth,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [color1, color2]),
            borderRadius: BorderRadius.circular(40)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: onPressed,
          child: textInput,
        ),
      ),
    );
  }
}
