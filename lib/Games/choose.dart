/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:get/route_manager.dart';
import 'package:memelord/Games/snake.dart';

class choose extends StatelessWidget {
  const choose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose your game"),
      ),

      body: Container(
        child: Column(
          children:<Widget> [ 
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialApp.router(builder: (context)(context, child) {
              return Snake();
            }, ,))
          } , child: Text("snake")),
          ElevatedButton(onPressed: () =>Chess() , child: Text("chess"))
       
          ]
          
          ),
      ),
      
    );
  }
} */