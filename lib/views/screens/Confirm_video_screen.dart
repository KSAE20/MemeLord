import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memelord/controllers/upload_video_controller.dart';
import 'package:memelord/views/screens/components/text_input_field_widget.dart';
import 'package:video_player/video_player.dart';

import '../widgets/dialog.dart';
import 'Home_Screen.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _videocaptionController = TextEditingController();
 UploadVideoController uploadVideoController =Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 400 ,//MediaQuery.of(context).size.width,
              height:300 ,//MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
/*                   Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _songController,
                      labelText: 'Song Name',
                      icon: Icons.music_note,
                    ),
                  ), */
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextField(
                      controller: _videocaptionController,
                     decoration: const InputDecoration(
                            hintText: ".Write a caption...",
                            border: OutlineInputBorder()  ),
                        maxLines: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: ()  async {
                        DialogHelper.showLoading();
                       await uploadVideoController.uploadVideo(
                          _videocaptionController.text,
                          widget.videoPath);
                        DialogHelper.hideLoading();
                       },

                      child: const Text(
                        'Post',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}