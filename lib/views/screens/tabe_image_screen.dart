import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:memelord/components/utils.dart';
import 'package:memelord/controllers/image_controller.dart';
import 'package:memelord/views/screens/Comment_Screen.dart';
import 'package:memelord/views/screens/video_screen_tab.dart';

import '../../constants.dart';
import '../../models/image.dart';

class TapImageScreen extends StatefulWidget {
  const TapImageScreen({Key? key}) : super(key: key);

  @override
  State<TapImageScreen> createState() => _TapImageScreenState();
}

class _TapImageScreenState extends State<TapImageScreen> {
  ImageController imageController = Get.put(ImageController());
  PageController pageController =  PageController(initialPage: 0, viewportFraction: 1);
  int count = 0;
  int countReact = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: imageController.imageList.length,
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = imageController.imageList[index];
            countReact =   data.sad!.length +  data.love!.length +  data.haha!.length  + data.angry!.length + data.likes.length  +  data.dislikes!.length ;
            count = int.parse( data.angry.toString().length.toString()) +
                int.parse( data.sad.toString().length.toString()) +
                int.parse( data.haha.toString().length.toString()) +
                int.parse( data.love.toString().length.toString());

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 135,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0 ),
                  child: PostHeader(
                      image: data.profilePhoto,
                      name: data.username,
                      timeAge: data.datePublished.toString() == "null"
                          ? "No time set"
                          : getTimeDifferenceFromNow(
                              data.datePublished.toString())),
                ),
                const AspectRatio(
                  aspectRatio: 20 / 5,
                  child: Image(
                    image: AssetImage('assets/images/talabat.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    data.caption,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.38,
                      color: Colors.white,
                      child: Image(
                        image: CachedNetworkImageProvider(data.imageUrl),
                      ),
                    ),

                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                              "${data.commentCount.toString()} Comments",
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
                    disLikeButton:() async {
                      await   pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeIn);
                      await imageController.disLikeVideo(data.id);

                    } ,
                      angry: () async {
                        await   pageController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        await imageController.angryVideo(data.id);
                      },
                      haha: ()async{
                        await   pageController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        await imageController.hahaVideo(data.id);
                      },
                      love: ()async{
                        await   pageController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        await imageController.loveVideo(data.id);
                      },
                      sad: ()async{
                        await   pageController.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeIn);
                        await imageController.sadVideo(data.id);
                      },

                    data:  data,
                    countComment: data.commentCount.toString(),
                    commentButton: () async {
                      await Get.to( CommentScreen(id:  data.id));
                    },
                    likeButton: () async {
                       pageController.nextPage(duration: const Duration( milliseconds: 1000), curve: Curves.easeIn);

                      await imageController.likeVideo(data.id);



                    }),
              ],
            );
          },
        );
      }),
    );
  }
}

class PostStats extends StatelessWidget {
  final String countComment;
  final Function() likeButton;
  final Function() disLikeButton;
  final Function() love;
  final Function() sad;
  final Function() angry;
  final Function() haha;
  final ImageModel data;
  final Function() commentButton;
  const PostStats({
    Key? key,
    required this.countComment,
    required this.likeButton,
    required this.commentButton,
    required this.data, required this.disLikeButton, required this.love, required this.sad, required this.angry, required this.haha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: InkWell(
                onTap: likeButton,
                child: Container(
                  color: data.likes.contains(authController.user.uid)
                      ?      Colors.green
                      :  const Color(0xfff0fff5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      MdiIcons.thumbUpOutline,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: haha,
                child: Container(
                  color:  data.haha!.contains(authController.user.uid)
                      ?      Colors.green
                      :  const Color(0xfff0fff5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        "assets/images/haha.png",
                      ),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: sad,
                child: Container(
                  color:  data.sad!.contains(authController.user.uid)
                      ?      Colors.green
                      :  const Color(0xfff0fff5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        "assets/images/sad.png",
                      ),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: love,
                child: Container(
                  color:  data.love!.contains(authController.user.uid)
                      ?      Colors.green
                      :  const Color(0xfff0fff5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        "assets/images/care.png",
                      ),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: angry,
                child: Container(
                  color:  data.angry!.contains(authController.user.uid)
                      ?      Colors.green
                      :  const Color(0xfff0fff5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(
                        "assets/images/angry.png",
                      ),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: disLikeButton,
                child: Container(
                  color:  data.dislikes!.contains(authController.user.uid)
                      ? Colors.red :Colors.red.shade100,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      MdiIcons.thumbDownOutline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color:  Colors.grey[600],
                size: 20.0,
              ),
              labelStyle: TextStyle(
                color:
                Colors.grey[600],
              ),
              label: '  Comments',
              onTap: commentButton,
            ),
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              labelStyle: TextStyle(
                color: Colors.grey[500],
              ),
              label: '  Share',
              onTap: (){},
            ),
          ],
        ),

      ],
    );
  }
}

class  PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final TextStyle labelStyle;
  final Function() onTap;

  const  PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade600)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Material(
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: 25.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    Text(label, style: labelStyle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
