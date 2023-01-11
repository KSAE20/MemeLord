import 'package:flutter/material.dart';
import 'package:memelord/components/utils.dart';
import 'package:memelord/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:memelord/models/user.dart';
import 'package:memelord/views/screens/profile_screen.dart';

/* import 'package:tiktok_tutorial/models/user.dart';
import 'package:tiktok_tutorial/views/screens/profile_screen.dart'; */
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = TextEditingController();
  final SearchController searchController = Get.put(SearchController());

  /// List of Tab Bar Item
  List<String> items = [
    "Trending",
    "Sports",
    "Series",
    "Gamming",
    "Anime",
    "Wrestling",
    "Football",
    "Movies",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person
  ];
  int current = 0;

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 243, 240, 240),
            title: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.cyan,
                    ),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  filled: false,
                  hintText: 'Search',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                controller: searchTextController,
                onFieldSubmitted: (value) {
                  searchController.searchUser(value);
                },
              ),
            ),
            elevation: 4.0,
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),

          /// APPBAR
          body: searchController.searchedUsers.isEmpty &&
                  searchTextController.text != "انتحار"
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      /// CUSTOM TABBAR
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.all(5),
                                      width: 80,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: current == index
                                            ? Colors.cyan
                                            : const Color.fromARGB(
                                                255, 218, 218, 218),
                                        borderRadius: current == index
                                            ? BorderRadius.circular(50)
                                            : BorderRadius.circular(40),
                                        border: current == index
                                            ? Border.all(
                                                color: const Color.fromARGB(
                                                    177, 255, 255, 255),
                                                width: 2)
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          items[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: current == index
                                                  ? const Color.fromARGB(
                                                      255, 255, 255, 255)
                                                  : const Color.fromARGB(
                                                      255, 0, 0, 0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: current == index,
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                        decoration: const BoxDecoration(
                                            color: Colors.cyan,
                                            shape: BoxShape.circle),
                                      ))
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                )
              : searchTextController.text == "انتحار"
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        //  height: 350,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child:const Image(
                            image:
                                AssetImage("assets/images/healthcare.png"),
                          )),
                      const   Text(
                        "You are not alone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      const SizedBox(height: 25,),
                      Wrap(
                     crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children:   [
                         const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:   Text(
                              "if you feel that you want to talk or need someone to help click o this icon",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 12),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: const SizedBox(
                              height: 50,
                              width: 50,
                              child:   Image(
                                image:
                                AssetImage("assets/images/call.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                  : ListView.builder(
                      itemCount: searchController.searchedUsers.length,
                      itemBuilder: (context, index) {
                        User user = searchController.searchedUsers[index];
                        return InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(uid: user.uid),
                            ),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                user.profilePhoto,
                              ),
                            ),
                            title: Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      );
    });
  }
}
