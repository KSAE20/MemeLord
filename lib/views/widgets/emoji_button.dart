import 'package:flutter/material.dart';
import 'package:get/get.dart';


class emoji_button extends StatelessWidget{

  final OnTap;
  bool isButtonPressed;

  emoji_button({this.OnTap, required this.isButtonPressed});
  Widget build (BuildContext context){  

    return GestureDetector(
      onTap: OnTap,
      child: AnimatedContainer(
        height: 48,
        width: 50,
        duration: Duration(microseconds: 200),
        color: isButtonPressed? Colors.green.withOpacity(0.7) : Colors.green.withOpacity(0.1),
        child: Icon(Icons.thumb_up_alt_outlined, 
        size: 35  ,

        ),
          
      ),
    );
  }
}