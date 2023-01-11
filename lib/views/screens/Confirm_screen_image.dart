import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memelord/controllers/image_controller.dart';

class ConfirmScreenImage extends StatefulWidget {
  final File imageFile;
  final String imagePath;
  const ConfirmScreenImage(
      {Key? key, required this.imageFile, required this.imagePath})
      : super(key: key);

  @override
  State<ConfirmScreenImage> createState() => _ConfirmScreenImageState();
}

class _ConfirmScreenImageState extends State<ConfirmScreenImage> {
  final captionImage = TextEditingController();
  ImageController  imageController = Get.put(  ImageController ());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image(
                image: FileImage(widget.imageFile),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width - 20,
              child: TextField(
                controller: captionImage,
                decoration: const InputDecoration(
                    hintText: "Write a caption...",
                    border: OutlineInputBorder()),
                maxLines: 8,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {

                await  imageController.uploadImage(captionImage.text.trim() ,widget. imageFile );
                print ("////////////!!!!Done");
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
      ),
    );
  }
}
