import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showLoading() {
    Get.dialog(
      const Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Image(
          image: AssetImage("assets/images/spanner.gif"),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
