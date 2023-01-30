import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:memelord/models/image.dart';

import '../constants.dart';
class ImageController extends GetxController
{

  final Rx<List<ImageModel>> _imageList = Rx<List<ImageModel>>([]);
  List<ImageModel> get imageList => _imageList.value;
  @override
  void onInit() {
    super.onInit();
    _imageList.bindStream(
        firestore.collection('images').snapshots().map((QuerySnapshot query) {
          List<ImageModel> retVal = [];
          for (var element in query.docs) {
            retVal.add(
              ImageModel.fromSnap(element),
            );
          }
          return retVal;
        }));
  }





  Future<String> _uploadImageToStorage(
      String id, File imagePath ) async {
    Reference ref = firebasStorage.ref().child('images').child(id);
    UploadTask uploadTask = ref.putFile(  imagePath);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  // upload image
  uploadImage(String caption,  File imagePath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
      await firestore.collection('users').doc(uid).get();
      // get id
      var allDocs = await firestore.collection('images').get();
      int len = allDocs.docs.length;
      String imageUrl =
      await _uploadImageToStorage("image $len", imagePath);
      String thumbnail = await _uploadImageToStorage("image $len", imagePath);

      ImageModel image = ImageModel(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "image $len",
        likes: [],
        love: [],
        haha: [],
        sad: [],
        angry: [],
        dislikes: [],
        commentCount: 0,
        shareCount: 0,
        //songName: songName,
        caption: caption,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnail,
        datePublished: DateTime.now().toString(),
        imageUrl: imageUrl,
      );

      await firestore.collection('images').doc('image $len').set(
        image.toJson(),
      );
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }

  likeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('images').doc(id).update({
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
    DocumentSnapshot doc = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['dislikes'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'dislikes': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('images').doc(id).update({
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
    DocumentSnapshot doc = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['love'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'love': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('images').doc(id).update({
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
    DocumentSnapshot doc = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['angry'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'angry': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('images').doc(id).update({
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
    DocumentSnapshot doc = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['haha'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'haha': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'sad': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('images').doc(id).update({
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
    DocumentSnapshot doc = await firestore.collection('images').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['sad'].contains(uid)) {
      await firestore.collection('images').doc(id).update({
        'sad': FieldValue.arrayRemove([uid]),
        'likes': FieldValue.arrayRemove([uid]),
        'love': FieldValue.arrayRemove([uid]),
        'haha': FieldValue.arrayRemove([uid]),
        'angry': FieldValue.arrayRemove([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('images').doc(id).update({
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
