import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:memelord/views/screens/video_screen_tab.dart';
  late TabController controller;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

 
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  bool isFollowingSelected = true ;

    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);

  
  }

  void dispose(){

    controller.dispose();
    super.dispose();
  }
  
 
 
 
 
 @override
 Widget build ( BuildContext context ) {
    return Scaffold (
      extendBodyBehindAppBar : true ,
      appBar : AppBar (
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/white meme.png', 
	
                   height: 30,
	
                   width: 30, ),
        ),
        elevation : 0.7 ,
        backgroundColor : Colors.white ,
        title : 
           Row (
            mainAxisAlignment : MainAxisAlignment.center ,
            crossAxisAlignment : CrossAxisAlignment.end ,
            children : [
              GestureDetector(
                  onTap : () => {
                setState ( ( ) {
                isFollowingSelected = true ;
                  } ),},
                child: Text (
                  " Home " ,
                  style : Theme.of ( context ) .textTheme.bodyText1 ! .copyWith (
                  fontSize : isFollowingSelected ? 22: 20 ,
                  color : isFollowingSelected ?Color.fromARGB(255, 0, 0, 0) :   Color.fromARGB(255, 214, 214, 214)) , ),
              ) , // Text
                
                Text (" | ",
                style : Theme.of ( context )
                .textTheme
                .bodyText1 !
                .copyWith ( fontSize : 20 , color : Colors.grey ) ,
                  ) , // Text
            GestureDetector (
                onTap : () => {
                setState ( ( ) {
                isFollowingSelected = false ;
                  } )
                       } , 
                child : Text (
                " Popular " ,
                style : Theme.of ( context ) .textTheme.bodyText1 !. copyWith (
                fontSize : !isFollowingSelected ? 22 : 20 ,
                color : !isFollowingSelected ?Color.fromARGB(255, 0, 0, 0) :   Color.fromARGB(255, 214, 214, 214) ) ,
            ) , // Text
            ) , // GestureDetector
            ] ,
            ),
       

               bottom:  PreferredSize(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color.fromARGB(255, 221, 220, 220),
                ), TabBar(
               controller: controller,
               tabs: 
               [Tab( icon: Icon(Icons.image_rounded),),
               Tab( icon: Icon(Icons.video_library),),
               Tab( icon:Icon( Icons.text_fields),)],
               indicatorColor:Colors.cyan ,
               labelColor: Colors.black),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(50)),
              ),
            body: TabBarView(controller: controller,
        
          children: [
        VideoScreenTab(),
  
         Center ( child : 
    //////////////////////////////////////////////write the screens here___== SecondPage()
         Text ( ' Tab 2 Content')),
         
                  Center ( child : 
    //////////////////////////////////////////////write the screens here___== SecondPage()
         Text ( ' Tab 3 Content')),
         ]
          
          ),
          
          
          );

          

         }
        
        }
/*
class HomePage extends StatefulWidget {
  const HomePage ( { Key ? key } ) : super ( key : key ) ;
}
 @override
 _HomePageState createState ( ) = > _HomePageState ( ) ;
class HomePageState extends State < HomePage > {
 bool isFollowingSelected = true ;
 @override
 Widget build ( BuildContext context ) {
    return Scaffold (
      extendBodyBehindAppBar : true ,
      appBar : AppBar (
        elevation : 0 ,
        backgroundColor : Colors.transparent ,
        title : Row (
          mainAxisAlignment : MainAxis Alignment.center ,
          crossAxisAlignment : CrossAxisAlignment.end ,
          children : [
            Text (
              " Following " ,
              style : Theme.of ( context )
                  .textTheme


*/