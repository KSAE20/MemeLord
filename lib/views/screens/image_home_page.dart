import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:memelord/views/screens/video_screen_tab.dart';

import '../../components/utils.dart';

class ImageHomePage extends StatelessWidget {
  const ImageHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        const SizedBox(
          height: 118,
        ),
        const AspectRatio(
          aspectRatio: 20 / 5,
          child: Image(
            image: AssetImage('assets/images/talabat.png'),
          ),
        ),
        PostHeader(
          image:
              "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-4.jpg",
          name: "mohammad",
          timeAge: DateTime.now().toString(),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.44,
          child: const Image(
              image: NetworkImage(
                  "https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-3.jpg")),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    "assets/images/wow.png",
                  ),
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
            InkWell(
              onTap: () {},
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
            ) ,
            InkWell(
              onTap: () {},
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
            )
          ],
        ),
        Row(
          children: [
            PostButton(
              icon: const Icon(
                MdiIcons.thumbUpOutline,
                color: blueColor,
                size: 20.0,
              ),
              labelStyle: const TextStyle(
                color:blueColor,
              ),
              label: 'Like',
              onTap: () {},
            ),
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              labelStyle: TextStyle(
                color: Colors.grey[600],
              ),
              label: ' Comments',
              onTap: () {},
            ),
            PostButton(
              icon: Icon(
                MdiIcons.share,
                color: Colors.grey[600],
                size: 20.0,
              ),
              labelStyle: TextStyle(
                color: Colors.grey[600],
              ),
              label: 'Share',
              onTap: () {},
            ),
          ],
        ),
      ],
    ));
  }
}
