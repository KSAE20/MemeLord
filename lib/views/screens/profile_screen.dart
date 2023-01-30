import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Games/chess.dart';
import '../../Games/snake.dart';
import '../../constants.dart';
import '../../controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black12,
              leading: const Icon(
                Icons.person_add_alt_1_outlined,
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    print("DDDDddddddddd");
                    await Alert(
                        style: const AlertStyle(
                            backgroundColor: Colors.transparent,
                            isCloseButton: false,
                            alertBorder: Border()),
                        context: context,
                        //   title: "Choose Your game",
                        content: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/card.png"))),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            controller.user['profilePhoto'],
                                        height: 75,
                                        width: 75,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                        ),
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40.0,
                                    ),
                                    const Text(
                                      "Name : ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      controller.user["name"],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 40.0,
                                    ),
                                    const Text(
                                      "Folllwers:",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      controller.user['followers'],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Text(
                                      "Most Gained Emoji",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Image(
                                      image: AssetImage(
                                        "assets/images/care.png",
                                      ),
                                      height: 25,
                                      width: 25,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Text(
                                      "IPP : ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "66%",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Text(
                                      "Badge : ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Image(
                                      image: AssetImage(
                                        "assets/images/badge.png",
                                      ),
                                      height: 25,
                                      width: 25,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Text(
                                      "Permutation : ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Image(
                                      image: AssetImage(
                                        "assets/images/arrow.png",
                                      ),
                                      height: 25,
                                      width: 25,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Text(
                                      "achievements : ",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Image(
                                      image: AssetImage(
                                        "assets/images/badge.png",
                                      ),
                                      height: 25,
                                      width: 25,
                                    )
                                  ],
                                ),
                              ]),
                        ),
                        buttons: []).show();
                  },
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
              title: Text(
                controller.user['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: controller.user['profilePhoto'],
                                  height: 100,
                                  width: 100,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              await Alert(
                                  style: const AlertStyle(
                                      backgroundColor: Colors.transparent,
                                      isCloseButton: false,
                                      alertBorder: Border()),
                                  context: context,
                                  //   title: "Choose Your game",
                                  content: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/card.png"))),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: controller
                                                      .user['profilePhoto'],
                                                  height: 75,
                                                  width: 75,
                                                  placeholder: (context, url) =>
                                                      const CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Icon(
                                                    Icons.error,
                                                  ),
                                                ),
                                              ),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 40.0,
                                              ),
                                              const Text(
                                                "Name : ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                controller.user["name"],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 40.0,
                                              ),
                                              const Text(
                                                "Folllwers:",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                controller.user['followers'],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              Text(
                                                "Most Gained Emoji",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/care.png",
                                                ),
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              Text(
                                                "IPP : ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                "66%",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              Text(
                                                "Badge : ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/badge.png",
                                                ),
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              Text(
                                                "Permutation : ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/arrow.png",
                                                ),
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 40.0,
                                              ),
                                              Text(
                                                "achievements : ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/badge.png",
                                                ),
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ]),
                                  ),
                                  buttons: []).show();
                            },
                            child: const Text(
                              "Profile info",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controller.user['following'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.black54,
                                width: 1,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.user['followers'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Followers',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.black54,
                                width: 1,
                                height: 15,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.user['likes'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Likes',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 140,
                            height: 47,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () async {
                                  if (widget.uid == authController.user.uid) {
                                    await Alert(
                                        context: context,
                                        title: "Are you shower signOut ? ",
                                        type: AlertType.warning,
                                        buttons: [
                                          DialogButton(
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.0),
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 179, 134, 1.0),
                                                    fontSize: 20),
                                              ),
                                            ),
                                            onPressed: () => Get.back(),
                                            color: Colors.transparent,
                                            radius: BorderRadius.circular(0.0),
                                          ),
                                          DialogButton(
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.0),
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            onPressed: () async {
                                              Get.back();
                                              authController.signOut();
                                            },
                                            color: Colors.transparent,
                                            radius: BorderRadius.circular(0.0),
                                          ),
                                        ]).show();
                                  } else {
                                    controller.followUser();
                                  }
                                },
                                child: Text(
                                  widget.uid == authController.user.uid
                                      ? 'Sign Out'
                                      : controller.user['isFollowing']
                                          ? 'Unfollow'
                                          : 'Follow',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          // video list
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.user['thumbnails'].length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              String thumbnail =
                                  controller.user['thumbnails'][index];
                              return CachedNetworkImage(
                                imageUrl: thumbnail,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
