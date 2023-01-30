import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/models/video.dart';
import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  RxBool isConnected = RxBool(true);

  List<Video> get videoList => _videoList.value;
  @override
  void onInit() {
    super.onInit();
    StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            isConnected.value = true;
            break;
          case InternetConnectionStatus.disconnected:
            isConnected.value = false;
            break;
        }
      },
    );

    _videoList.bindStream(
        firestore.collection('videos').snapshots().map((QuerySnapshot query) {
      List<Video> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          Video.fromSnap(element),
        );
      }
      return retVal;
    }));
  }

  likeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });

    }
  }

  disLikeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['dislikes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'dislikes': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'dislikes': FieldValue.arrayUnion([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
      });
    }
  }

  loveVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['love'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'love': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'love': FieldValue.arrayUnion([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  angryVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['angry'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'angry': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'angry': FieldValue.arrayUnion([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  hahaVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['haha'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'haha': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'haha': FieldValue.arrayUnion([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  sadVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['sad'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'sad': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'sad': FieldValue.arrayUnion([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
  }
}
