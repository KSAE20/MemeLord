import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
  String username;
  String uid;
  String id;
  List likes;
  List? love;
  List? haha;
  List? sad;
  List? angry;
  List? dislikes;
  int commentCount;
  int shareCount;
  String? datePublished;
  //String songName;
  String caption;
  String imageUrl;
  String thumbnail;
  String profilePhoto;

  ImageModel({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    this.love,
    this.haha,
    this.sad,
    this.angry,
    this.dislikes,
    this.datePublished,
    required this.commentCount,
    required this.shareCount,
    // required this.songName,
    required this.caption,
    required this.imageUrl,
    required this.profilePhoto,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "profilePhoto": profilePhoto,
    "id": id,
    "likes": likes,
    "love": love,
    "haha": haha,
    "sad": sad,
    "angry": angry,
    "dislikes": dislikes,
    "commentCount": commentCount,
    "shareCount": shareCount,
    "datePublished": datePublished,
    // "songName": songName,
    "caption": caption,
    "videoUrl": imageUrl,
    "thumbnail": thumbnail,
  };

  static ImageModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ImageModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      love: snapshot['love'],
      haha: snapshot['haha'],
      sad: snapshot['sad'],
      angry: snapshot['angry'],
      dislikes: snapshot['dislikes'],
      datePublished: snapshot['datePublished'],
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      //songName: snapshot['songName'],
      caption: snapshot['caption'],
      imageUrl: snapshot['videoUrl'],
      profilePhoto: snapshot['profilePhoto'],
      thumbnail: snapshot['thumbnail'],
    );
  }
}
