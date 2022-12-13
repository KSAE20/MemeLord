import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class thetrial extends StatefulWidget {
  const thetrial({Key? key}) : super(key: key);

  @override
  State<thetrial> createState() => _thetrialState();
}

class _thetrialState extends State<thetrial> {

/*   Object ? earth ;
 void initState() {
      
    // assigning name to the objects and providing the
    // object's file path (obj file) 
    earth = Object();

    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    return Center(
      child : ModelViewer(

src: "assets/images/trial.obj",
      ),
    );
  }
}