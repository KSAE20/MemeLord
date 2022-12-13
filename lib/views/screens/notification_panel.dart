import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class notification_panel extends StatefulWidget {
  const notification_panel({Key? key}) : super(key: key);

  @override
  State<notification_panel> createState() => _notification_panelState();
}

class _notification_panelState extends State<notification_panel> {
  @override
   Color _colorContainer = Color.fromARGB(255, 203, 251, 255);
 
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        color: Colors.white ,
        child: Column(
          
          children: [
                  SizedBox(height: 5),
            Ink(
              child: InkWell(
                child: Container(
                    height: 70,
                  decoration: BoxDecoration(
                          color: _colorContainer ,
                  border: Border(bottom: BorderSide(color: Colors.black, width: 0.1,)
                  )
                  ),
                  child: Row(children: [
                    SizedBox(width: 5,),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                        CircleAvatar(
                        radius: 26,
                        backgroundColor: Color.fromARGB(255, 184, 184, 184),
                     
              
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage('assets/images/not.png'),
                      ), 
               ), 
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 3.0,end: 3.0),
                        child: CircleAvatar(
                          radius: 5.0,
                          backgroundColor: Colors.green ,
                        ),
                      )
                    ],
                  ),
           
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Meme Lord',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height:3 ,),
                      Row(children: [
                        Text('We are glad that you are here ',style: TextStyle(fontSize: 12))
                      ],)
                    ],
                  ),
                      ],
                  ),
                ),
                onTap: () {
              setState(() {
                _colorContainer = Color.fromARGB(255, 241, 241, 241); }
               ); }
              
              ),
            ),
          ],
        ),
      ),
    );
  }

}