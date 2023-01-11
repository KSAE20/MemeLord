import 'dart:async';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:get/get.dart';
//import 'package:internet_connection_checker/internet_connection_checker.dart';



class HomeController extends GetxController {
  RxBool isConnected = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    // InternetConnectionChecker().onStatusChange.listen(
    //       (InternetConnectionStatus status) {
    //     switch (status) {
    //       case InternetConnectionStatus.connected:
    //         isConnected.value == true;
    //         //print('You are disconnected from the internet.$status ' );
    //         break;
    //       case InternetConnectionStatus.disconnected:
    //       // ignore: avoid_print
    //       //   print('You are disconnected from the internet. $status');
    //         isConnected.value == false;
    //         break;
    //     }
    //   },
    // );

  }
}
