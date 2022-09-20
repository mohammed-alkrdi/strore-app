

import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_products/const/app_colors.dart';
import 'package:store_products/view/auth/register_screen.dart';
import 'package:store_products/widgets/rounded_button.dart';
import 'package:store_products/widgets/text_form_field.dart';
import 'package:store_products/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {


  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
     late final AnimationController _controller = AnimationController(
         value: 0.0,
         duration: Duration(seconds: 25),
         upperBound: 1,
         lowerBound: -1,
         vsync: this
     )..repeat();

  @override
  void initState() {
    //_controller =
    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if(_controller == null) return Container();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedBuilder(animation: _controller, builder: (BuildContext context, Widget? child ) {
                  return ClipPath(
                    clipper: DrawClip(_controller.value),
                    child: Container(
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [AppColors.logoColor1, AppColors.logoColor2]),

                      ),
                      child: child,
                    ),
                  );
                }),

                Container(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 160,
                      child: Image.asset(
                        "assets/images/store_logo_7-removebg-preview.png",
                      )),
                ),
                TextInput(
                  text: "Log in to find your product easily and smoothly",
                  color: AppColors.whiteMode,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const TextInput(
              text: "Sign in to continue",
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldInput(
              hint: "Email",
              icon: Icons.email,
              color: AppColors.formFieldColor,
              textColor: AppColors.dark,
              width: 2,
              obscureText: false,
              inputType: TextInputType.name,
              inputAction: TextInputAction.next,
              onSaved: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldInput(
              hint: "Password",
              icon: Icons.lock,
              color: AppColors.formFieldColor,
              textColor: AppColors.dark,
              width: 2,
              obscureText: true,
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              onSaved: (value) {},
              validator: (value) {},
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              sizeHeight: 40,
              sizeWidth: 300,
              textInput: const TextInput(
                text: "Sign in",
                color: Colors.white,
                fontSize: 15,
              ),
              color1: AppColors.logoColor1,
              color2: AppColors.logoColor2,
              onPressed: () {},
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextInput(
                  text: "Don't have an account?",
                  fontSize: 15,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  fontWeight: FontWeight.w400,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => const RegisterScreen(),
                      transition: Transition.fade),
                  //nextScreen(context, const RegisterScreen()),
                  child: TextInput(
                    text: 'Register here',
                    color: AppColors.formFieldColor,
                    fontSize: 15,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  DrawClip(this.move);

  @override
  Path getClip(Size size) {
    print(move);
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter = size.width * 0.5 + Math.sin(move);
    double yCenter = size.height;

    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
