import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/components/utils.dart';
import 'package:memelord/controllers/video_controller.dart';
import 'package:memelord/models/comment.dart';
import 'package:memelord/views/screens/Comment_Screen.dart';
import 'package:memelord/views/screens/Home_Screen.dart';
import 'package:memelord/views/widgets/Video_player_item.dart';
import 'dart:math' as math;

import 'package:memelord/views/widgets/emoji_button.dart';

import '../../models/video.dart';
import '../widgets/cash_image.dart';

class VideoScreenTab extends StatefulWidget {
  VideoScreenTab({Key? key}) : super(key: key);
  State<VideoScreenTab> createState() => _VideoScreenTab();
}

class _VideoScreenTab extends State<VideoScreenTab> {
  final VideoController videoController = Get.put(VideoController());
  Color upvoteColor = Colors.green.withOpacity(0.1);
  Color downvoteColor = Colors.red.withOpacity(0.1);
  bool isButtonPressed = false;

  buildProfile(String profilePhoto) {
    return SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              left: 5,
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
                  child: Image(
                    image: NetworkImage(profilePhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
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
                      horizontal: 10.0 ),
                  child: PostHeader(
                      image: data.profilePhoto,
                      name: data.username,
                      timeAge: data.datePublished.toString() == "null"
                          ? "No time set"
                          : getTimeDifferenceFromNow(
                              data.datePublished.toString())),
                ),
                const AspectRatio(
                  aspectRatio: 20 / 4.9,
                  child: Image(
                    image: AssetImage('assets/images/talabat.png'),
                  ),
                ),

                Text(
                  data.caption,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: VideoPlayerItem(
                      pageController: pageController,
                      data: data,
                      commentCount: data.commentCount,
                      videoUrl: data.videoUrl,
                      authControllerId: authController.user.uid,
                      dataId: data.id,
                    ),
                  ),
                ),

              ],
            );
          },
        );
      }),
    );
  }
}

String getTimeDifferenceFromNow(String dateTime) {
  Duration difference = DateTime.now().difference(DateTime.parse(dateTime));
  if (difference.inSeconds < 5) {
    return "Just now";
  } else if (difference.inMinutes < 1) {
    return "${difference.inSeconds} s ago";
  } else if (difference.inHours < 1) {
    return "${difference.inMinutes} m ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} h ago";
  } else {
    return "${difference.inDays} d ago";
  }
}

class PostHeader extends StatelessWidget {
  final String image;
  final String name;
  final String timeAge;

  const PostHeader({
    Key? key,
    required this.image,
    required this.name,
    required this.timeAge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: image),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '$timeAge • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  final String countComment;
  final Function() likeButton;
  final Function() disLikeButton;
  final Function() loveButton;
  final Function() angryButton;
  final Function() sadButton;
  final Function() hahaButton;

  final Video data;
  final Function() commentButton;
  const PostStats({
    Key? key,
   required this.loveButton,
    required this.countComment,
    required this.likeButton,
    required this.commentButton,
    required this.data,
    required this.angryButton, required this.sadButton, required this.hahaButton, required this.disLikeButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      VideoController videoController = Get.find();
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
                  color: ( data.likes.contains(authController.user.uid)  )
                      ? Colors.green
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
                onTap: hahaButton,
                child: Container(
                  color: data.haha!.contains(authController.user.uid)
                      ? Colors.green : Color(0xfff0fff5),
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
                onTap: sadButton,
                child: Container(
                  color: data.sad!.contains(authController.user.uid)
                      ? Colors.green : Color(0xfff0fff5),
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
                onTap: loveButton,
                child: Container(
                  color: data.love!.contains(authController.user.uid)
                      ? Colors.green : Color(0xfff0fff5),
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
                onTap: angryButton,
                child: Container(
                  color: data.angry!.contains(authController.user.uid)  ? Colors.green : Color(0xfff0fff5),
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
                  color : data.dislikes!.contains(authController.user.uid)
                      ? Colors.red : Colors.red.shade100,
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

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final TextStyle labelStyle;
  final Function() onTap;

  const PostButton({
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
