import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Color color;
  final Color textColor;
  final double width;
  final bool obscureText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  Function(String? value) onSaved;
  String? Function(String? value) validator;

  TextFieldInput(
      {Key? key,
      required this.hint,
      required this.icon,
      required this.color,
      required this.textColor,
      required this.width,
      required this.obscureText,
      required this.inputType,
      required this.inputAction,
      required this.onSaved,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        style: TextStyle(
          color: textColor,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: color,),
          labelText: hint,
          labelStyle: TextStyle(color: color),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
          errorStyle: TextStyle(color: color),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: width),
          ),
        ),
        validator: validator,
        onChanged: onSaved,
        obscureText: obscureText,
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}
