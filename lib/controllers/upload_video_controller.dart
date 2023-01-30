import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:memelord/constants.dart';
import 'package:memelord/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.LowQuality,
      deleteOrigin: true,
      includeAudio: true,
    );
    print ("ZZZZZZZZZZZZZZZZZZZZZZZZZZZz");
    return compressedVideo!.file;
  }




  Future<String> _uploadVideoToStorage(
      String id, String videoPath, String caption) async {
    Reference ref = firebasStorage.ref().child('videos').child(id);
    print(_compressVideo(videoPath));
    print("2BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
    UploadTask uploadTask =  ref.putFile(await _compressVideo(videoPath));
    print("1BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebasStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // upload video
  uploadVideo(String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      // get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      print ("AAAAAAAAAAAAAAAAAAAAAAA");
      String videoUrl =
          await _uploadVideoToStorage("Video $len", videoPath, caption);
      print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
      print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCc");

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
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
        videoUrl: videoUrl,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnail,
        datePublished: DateTime.now().toString(),
      );

      await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
}
