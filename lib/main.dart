import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memelord/controllers/Auth_controller.dart';
import 'package:memelord/views/screens/3dtrial.dart';
import 'package:memelord/views/screens/Bottom_nav_bar.dart';
import 'package:memelord/views/screens/Home_Screen.dart';
import 'package:memelord/views/screens/Splash_screen.dart';
import 'package:memelord/views/screens/Upload_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp().then((value){
 Get.put(AuthController());

});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Lord',
      home://HomeScreen(),
      //chooseupload(), 
      //thetrial()
      Splashscreen(),
      //bottomnavbar(),
    );
  }
}