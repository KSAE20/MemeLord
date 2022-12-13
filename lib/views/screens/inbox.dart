import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class inbox extends StatelessWidget {
  const inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/box.png',width: 150,height: 150,),
        SizedBox(height: 11),
          Text('Your box is empty',style: TextStyle(fontSize: 16 )),

      ]) ,
    );
  }
}