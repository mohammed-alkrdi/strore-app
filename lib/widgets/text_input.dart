import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String text;
  final Alignment? alignment;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const TextInput(
      {Key? key,
      required this.text,
      this.alignment = Alignment.center,
      this.color = Colors.black,
      this.fontSize = 24,
      this.fontFamily,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
