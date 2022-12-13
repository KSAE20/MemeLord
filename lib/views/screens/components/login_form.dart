import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/views/screens/components/rounded_button.dart';

import 'package:memelord/views/screens/components/text_input_field_widget.dart';

class LoginForm extends StatelessWidget {
   const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.emailController,
    required this.passwordController
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                
                SizedBox(height: 40),

                Lottie.asset('assets/images/wavingpeople3.json',
                width:300 , height: 250 ),

                SizedBox(height: 40),

                TextInputField(controller: emailController ,icon: Icons.email,labelText: 'Email',hint: 'memelord@gmail.com', ),

                TextInputField(controller: passwordController ,icon: Icons.lock,labelText: 'Password', isObscure: true,hint: 'ex:20#26*d7'),

                SizedBox(height: 10),

                InkWell(         
                  child: Text('press'),
                  onTap: () => authController.loginUser(
                  emailController.text,
                  passwordController.text,
                ),
                ),

                SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }
}