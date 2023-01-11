import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:video_player/video_player.dart';

import '../../Games/chess.dart';
import '../../Games/snake.dart';
import '../../controllers/video_controller.dart';
import '../../models/video.dart';
import '../screens/Comment_Screen.dart';
import '../screens/video_screen_tab.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String dataId;
  final Video data;
  final int commentCount;
  final PageController pageController;
  final String authControllerId;
  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
    required this.dataId,
    required this.authControllerId,
    required this.commentCount,
    required this.data,
    required this.pageController,
  }) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  int countReact = 0;
  int count = 0;
  bool check = true ;
  Future<void> checkInternet () async {

    if (check  )
      {
        bool isConnected =
        await InternetConnectionChecker().hasConnection;
        if (isConnected == false)
        {
          await Alert(
              context: context,
              image: const Image(
                image: AssetImage("assets/images/NoInternet.png"),
                height: 75,
                width: 75,
              ),
              title: "There is not internet connection ",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "check if your connection stable ",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 179, 134, 1.0),
                          fontSize: 20),
                    ),
                  ),
                  onPressed: () => Get.back(),
                  color: Colors.transparent,
                  radius: BorderRadius.circular(0.0),
                ),
                DialogButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Games",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                  onPressed: () async {
                    Get.back();
                    await Alert(
                        context: context,
                        title: "Choose Your game",
                        content: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:   [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Get.to(()=>Snake());
                                },
                                child: Column(
                                  children: const [
                                    const SizedBox(height: 24.0,) ,
                                    Image(
                                      image:
                                      AssetImage("assets/images/snak.jpg" ,),
                                      width: 75,
                                      height: 75,

                                    ),
                                    const SizedBox(height: 12.0,) ,
                                    Text(
                                      "1 Player",
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ) ,
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Get.to(()=>chess());
                                },
                                child: Column(
                                  children: const [
                                    const SizedBox(height: 24.0,) ,
                                    Image(
                                      image:
                                      AssetImage("assets/images/chees.jpg"),
                                      width: 75,
                                      height: 75,
                                    ),
                                    const SizedBox(height: 12.0,) ,
                                    Text(
                                      "2 Player",
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        buttons: [
                          // DialogButton(
                          //   child: const Padding(
                          //     padding:
                          //         EdgeInsets.symmetric(horizontal: 12.0),
                          //     child: Text(
                          //       "Continue",
                          //       style: TextStyle(
                          //           color:
                          //               Color.fromRGBO(0, 179, 134, 1.0),
                          //           fontSize: 20),
                          //     ),
                          //   ),
                          //   onPressed: () => Navigator.pop(context),
                          //   color: Colors.transparent,
                          //   radius: BorderRadius.circular(0.0),
                          // ),
                          // DialogButton(
                          //   child: const Padding(
                          //     padding:
                          //         EdgeInsets.symmetric(horizontal: 12.0),
                          //     child: Text(
                          //       "Games",
                          //       style: TextStyle(
                          //           color: Colors.red, fontSize: 20),
                          //     ),
                          //   ),
                          //   onPressed: () => Navigator.pop(context),
                          //   color: Colors.transparent,
                          //   radius: BorderRadius.circular(0.0),
                          // ),
                        ]).show();
                  },
                  color: Colors.transparent,
                  radius: BorderRadius.circular(0.0),
                ),
              ]).show();
        }
      }
    check == false ;

  }

  VideoController videoController = Get.find();

  countVideo (){
    countReact =  widget.data.sad!.length +  widget.data.love!.length +  widget.data.haha!.length  + widget.data.angry!.length +widget.data.likes.length  + widget.data.dislikes!.length ;
      print (countReact);
      print ("QQQQQQQQQQQQq");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then(
        (value) {
          videoPlayerController.play();
          videoPlayerController.setVolume(1);
        },
      );
    countVideo();
    count = int.parse(widget.data.angry.toString().length.toString()) +
        int.parse(widget.data.sad.toString().length.toString()) +
        int.parse(widget.data.haha.toString().length.toString()) +
        int.parse(widget.data.love.toString().length.toString());


 //   checkInternet();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.38,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: VideoPlayer(
              videoPlayerController,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Image(
                      image: AssetImage(
                        "assets/images/haha.png",
                      ),
                      height: 12,
                      width: 12,
                    ),
                    const Image(
                      image: AssetImage(
                        "assets/images/sad.png",
                      ),
                      height: 12,
                      width: 12,
                    ),
                    Text(countReact.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(count.toString() ,  style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),),
                           Text(" Viewer" ,     style: TextStyle(
                       color: Colors.grey[600],
                       fontSize: 14.0,
                       ),),
                      ],
                    ),
                    const SizedBox(width: 10.00,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        "${widget.data.commentCount.toString()} Comments",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PostStats(
            //
            disLikeButton: () async {
              await  widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
                videoController.isDisLike.value = true ;
                videoController.isLike.value = false ;
                videoController.isLove .value = false ;
                videoController.isAngry.value = false ;
                videoController.isSad.value = false ;
                videoController.isHaha.value = false ;
                await videoController.disLikeVideo(widget.data.id);
            },
            hahaButton: () async {
              await  widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
              videoController.isHaha.value = true ;
              videoController.isDisLike.value = false ;
              videoController.isLike.value = false ;
              videoController.isLove .value = false ;
              videoController.isAngry.value = false ;
              videoController.isSad.value = false ;
              await videoController.hahaVideo(widget.data.id);

            },
            sadButton: () async {
              await  widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
              videoController.isSad.value = true ;
              videoController.isDisLike.value = false ;
              videoController.isLike.value = false ;
              videoController.isLove .value = false ;
              videoController.isAngry.value = false ;
              videoController.isHaha.value = false ;
              await videoController.sadVideo(widget.data.id);

            },
            angryButton: () async {
              await  widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
              videoController.isAngry.value = true ;
              videoController.isDisLike.value = false ;
              videoController.isLike.value = false ;
              videoController.isLove .value = false ;
              videoController.isSad.value = false ;
              videoController.isHaha.value = false ;
              await videoController.angryVideo(widget.data.id);

            },
            data: widget.data,
            countComment: widget.data.commentCount.toString(),
            commentButton: () async {
              await Get.to(CommentScreen(id: widget.data.id));
            },
            likeButton: () async {
              await  widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
              videoController.isLike.value = true ;
              videoController.isDisLike.value = false ;
              videoController.isLove .value = false ;
              videoController.isAngry.value = false ;
              videoController.isSad.value = false ;
              videoController.isHaha.value = false ;
              bool isConnected =
                  await InternetConnectionChecker().hasConnection;
              if (isConnected == false)
              {
                await Alert(
                    context: context,
                    image: const Image(
                      image: AssetImage("assets/images/NoInternet.png"),
                      height: 75,
                      width: 75,
                    ),
                    title: "There is not internet connection ",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "check if your connection stable ",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 179, 134, 1.0),
                                fontSize: 20),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Colors.transparent,
                        radius: BorderRadius.circular(0.0),
                      ),
                      DialogButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Games",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ),
                        onPressed: () async {
                          Get.back();
                          await Alert(
                              context: context,
                              title: "Choose Your game",
                              content: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:   [
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Get.to(()=>Snake());
                                      },
                                      child: Column(
                                        children: const [
                                          const SizedBox(height: 24.0,) ,
                                          Image(
                                            image:
                                            AssetImage("assets/images/snak.jpg" ,),
                                            width: 75,
                                            height: 75,

                                          ),
                                          const SizedBox(height: 12.0,) ,
                                          Text(
                                            "1 Player",
                                            style: TextStyle(fontSize: 14, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ) ,
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Get.to(()=>chess());
                                      },
                                      child: Column(
                                        children: const [
                                          const SizedBox(height: 24.0,) ,
                                          Image(
                                            image:
                                            AssetImage("assets/images/chees.jpg"),
                                            width: 75,
                                            height: 75,
                                          ),
                                          const SizedBox(height: 12.0,) ,
                                          Text(
                                            "2 Player",
                                            style: TextStyle(fontSize: 14, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              buttons: [
                                // DialogButton(
                                //   child: const Padding(
                                //     padding:
                                //         EdgeInsets.symmetric(horizontal: 12.0),
                                //     child: Text(
                                //       "Continue",
                                //       style: TextStyle(
                                //           color:
                                //               Color.fromRGBO(0, 179, 134, 1.0),
                                //           fontSize: 20),
                                //     ),
                                //   ),
                                //   onPressed: () => Navigator.pop(context),
                                //   color: Colors.transparent,
                                //   radius: BorderRadius.circular(0.0),
                                // ),
                                // DialogButton(
                                //   child: const Padding(
                                //     padding:
                                //         EdgeInsets.symmetric(horizontal: 12.0),
                                //     child: Text(
                                //       "Games",
                                //       style: TextStyle(
                                //           color: Colors.red, fontSize: 20),
                                //     ),
                                //   ),
                                //   onPressed: () => Navigator.pop(context),
                                //   color: Colors.transparent,
                                //   radius: BorderRadius.circular(0.0),
                                // ),
                              ]).show();
                        },
                        color: Colors.transparent,
                        radius: BorderRadius.circular(0.0),
                      ),
                    ]).show();
              }
              else {

                await videoController.likeVideo(widget.data.id);
              }



            },
            loveButton: () async {
              await   widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
              videoController.isLove .value = true ;
              videoController.isDisLike.value = false ;
              videoController.isLike.value = false ;
              videoController.isAngry.value = false ;
              videoController.isSad.value = false ;
              videoController.isHaha.value = false ;

              await videoController.loveVideo(widget.data.id);

            },
          ),
        ],
      ),
    );
  }
}
