import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
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
  String videoUrl;
  String thumbnail;
  String profilePhoto;

  Video({
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
    required this.videoUrl,
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
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
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
      videoUrl: snapshot['videoUrl'],
      profilePhoto: snapshot['profilePhoto'],
      thumbnail: snapshot['thumbnail'],
    );
  }
}
