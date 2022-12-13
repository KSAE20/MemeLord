import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 0,
            ),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(
                255,
                32,
                211,
                234,),

               border:  Border.all(
                color: Colors.black,
                width : 1.5
               ),
                
            //borderRadius: BorderRadius.circular(70),
            ),
          ),
         /* Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: 38,
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                32,
                211,
                234,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),*/
          Center(
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.white,
               // shape: BoxShape.circle,
               border:  Border.all(
                color: Colors.black,
                width : 1.4
               ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}