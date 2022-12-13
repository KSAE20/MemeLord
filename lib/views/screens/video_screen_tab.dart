import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/controllers/Comment_controller.dart';
import 'package:memelord/controllers/video_controller.dart';
import 'package:memelord/models/comment.dart';
import 'package:memelord/views/screens/Comment_Screen.dart';
import 'package:memelord/views/screens/Home_Screen.dart';
import 'package:memelord/views/widgets/Video_player_item.dart';
import 'dart:math' as math;

import 'package:memelord/views/widgets/emoji_button.dart'; 

class VideoScreenTab extends StatefulWidget {
   VideoScreenTab({Key? key}) : super(key: key);
   State<VideoScreenTab> createState() => _VideoScreenTab();
}


class _VideoScreenTab extends State <VideoScreenTab>{

  final VideoController videoController =Get.put(VideoController());
  Color upvoteColor = Colors.green.withOpacity(0.1);
  Color downvoteColor = Colors.red.withOpacity(0.1);
  bool isButtonPressed =false;
  
  void buttonPressed (){
    setState(() {
      if (isButtonPressed==false){
        isButtonPressed = true;
      }else if (isButtonPressed == true){
        isButtonPressed = false;
      }
    });
  }
  buildProfile(String profilePhoto){

               return SizedBox(
                          height: 60,
                          width: 60,
                            child: Stack(
                              children: [
                                Positioned(left: 5,
                              child: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(25), 
                                ),
                                child: ClipRRect(
                                borderRadius: BorderRadius.circular(25), 
                                child: Image(image: NetworkImage(profilePhoto),
                                fit: BoxFit.cover,
                                 ),
                                ),
                              ),  
                                
                              ),
                              ],
                            )
                          );
  }


  @override
  Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(() {
          return PageView.builder(
              itemCount:  videoController.videoList.length ,
              controller: PageController(initialPage: 0, viewportFraction: 1),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final data =videoController.videoList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
      
                      SizedBox(height:165 ),
                      Expanded(
                        child: Row(
                          
                          children: [
                            
                            
                            buildProfile(data.profilePhoto),
                                           
                           SizedBox(width: 10),
                            Expanded(
                              child: Column( 
                                crossAxisAlignment:  CrossAxisAlignment.start,
                              children: [
                                Text(data.username,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,),
                            
                                Row(
                                  children: [
                                    Text('yesterday at 1:22 pm'),
                                 /*    Text(data.caption), */
                                  ],
                                )
                              ],
                              ),
                            )
                          ],
                        ),
                      ),
      
      
                      AspectRatio(
                        aspectRatio: 21/7,
                        child: Image(image: AssetImage('assets/images/talabat.png'),
                        height: 130, width: 700,),
                      ),
                        SizedBox(
                          height:250, width: 400  ,
                          child:
                           
                          Expanded(child: VideoPlayerItem(videoUrl: data.videoUrl,)),), 
                       
                          /*   Ink(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: ()=> videoController.likeVideo(data.id)
                                    ,
                                    child: Ink(
                                      height: 50, 
                                      width: 50,
                                      color: data.likes.contains(authController.user.uid)? Colors.green.withOpacity(0.7):Colors.green.withOpacity(0.1),
                                      child:  const Center(
                                        child: Image(image: AssetImage('assets/images/care.png'),),
                                      ),

                                    ),
                                  )
                                ],
                              ),
                            ), */
                         Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                  child: emoji_button(isButtonPressed: isButtonPressed, OnTap: buttonPressed,)
                                   /* Container(
                                  color: data.likes.contains(authController.user.uid)? Colors.green.withOpacity(0.7): /* ColorTween(begin:Colors.amber ,end:Colors.blueAccent ), */  Colors.green.withOpacity(0.1),
                                  child: 
                                  Column(
                                    children: [
                                      IconButton(onPressed: (){} /* videoController.likeVideo(data.id) */, icon: Icon(Icons.thumb_up_alt_outlined),iconSize: 30)
                                    ],
                                   )) */),
                                  Expanded(

                                   child: Container(
                                  color: data.likes.contains(authController.user.uid)? Colors.green.withOpacity(0.7):  Colors.green.withOpacity(0.1),
                                  child: 
                                  Column(children: [
                                      IconButton(onPressed: ()=> videoController.likeVideo(data.id), icon: Image.asset('assets/images/care.png'),iconSize: 10),
                                    ],)) ),
                                  Expanded(
                                  child: Container(
                                  color: Colors.green.withOpacity(0.1),
                                  child: 
                                  Column(children: [
                                      IconButton(onPressed: (){}, icon: Image.asset('assets/images/haha.png'),iconSize: 10,)
                                    ],))),
                                  Expanded(
                                  child: Container(
                                  color: Colors.green.withOpacity(0.1),
                                  child: 
                                  Column(children: [
                                      IconButton(onPressed: (){}, icon: Image.asset('assets/images/sad.png'),iconSize: 10)
                                    ],))),
                                  Expanded(
                                  child: Container(
                                  color: Colors.green.withOpacity(0.1),
                                  child: 
                                  Column(children: [
                                      IconButton(onPressed: (){}, icon:Image.asset('assets/images/wow.png'),iconSize: 10)
                                    ],))),
                                   Expanded(
                                  child: Container(
                                  color: Colors.green.withOpacity(0.1),
                                  child: 
                                  Column(children: [
                                      IconButton(onPressed: (){}, icon:Image.asset('assets/images/angry.png'),iconSize: 10)
                                    ],))),
                                  Expanded(
                                  child: Container(
                                  color: Colors.red.withOpacity(0.1),
                                  child: 
                                  Column(children: [
                                      IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_outlined),iconSize: 30)
                                    ],)))
                                ],
                              ),
                            ],
                          ),
                        ), 
      
                        Row(
                          children: [
                            Expanded(
                            child:
                                OutlinedButton.icon(onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CommentScreen(id: data.id),)) , icon: Icon(Icons.comment,color: Colors.black), label: Text('Comment',style: TextStyle(color: Colors.black)),
                                style: OutlinedButton.styleFrom(side: BorderSide(width: 0.8, color: Colors.black) ),
                                ),
                               
                            ),
                            SizedBox(width: 3,),
                            Expanded(
                            child: 
                             OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.double_arrow,color: Colors.black), label: Text('Share',style: TextStyle(color: Colors.black)),
                             style: OutlinedButton.styleFrom(side: BorderSide(width: 0.8, color: Colors.black) ),
                                ),
                           
                            ),
                          ],
                        )
      
      
      
                          
      
                        ],
      
      
                    
                    ),
                );
              },
          );
        }
      ),
    );
  }
}