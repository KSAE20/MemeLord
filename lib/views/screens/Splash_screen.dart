import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:memelord/views/screens/Introduction_screen.dart';





class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/theusedwavesplash.json'),
      backgroundColor: Colors.white,
      splashIconSize: 250,
      nextScreen: OnBoardingPage() ,
      duration: 2000
      //1196,
    
      );
      }
}