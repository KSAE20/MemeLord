import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memelord/controllers/Auth_controller.dart';
import 'package:memelord/views/screens/Bell_alertring_panel.dart';
import 'package:memelord/views/screens/Home_Screen.dart';
import 'package:memelord/views/screens/Search_screen.dart';
import 'package:memelord/views/screens/Upload_screen.dart';

import 'views/screens/profile_screen.dart';



List pages = [
  HomeScreen(),
  SearchScreen(),
  chooseupload(),
  Bell_alerting_panel(),
  ProfileScreen(uid: authController.user.uid),
];




/*List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
];*/


//colors

const kPrimaryColor = Color.fromARGB(255, 0, 186, 243);
const kBackgroundColor = Color(0XFFE5E5E5);

//firebase
var firebaseAuth = FirebaseAuth.instance;
var firebasStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;