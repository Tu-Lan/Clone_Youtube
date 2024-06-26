import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:watch_video/cores/methods.dart';
import 'package:watch_video/features/upload/long_video/video_resposity.dart';

class VideoDetailsPage extends ConsumerStatefulWidget {
  final File? video;
  const VideoDetailsPage(this.video, {super.key});

  @override
  ConsumerState<VideoDetailsPage> createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends ConsumerState<VideoDetailsPage> {
  final titleController = TextEditingController();
  final descriptiomController = TextEditingController();
  File? image;
  bool isThumbnailSelected = false;
  String randomNumber = const Uuid().v4();
  String videoId = const Uuid().v4();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Nhập tiêu đề",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Nhập tiêu đề",
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Nhập mô tả",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: descriptiomController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Nhập mô tả",
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),

              //select thumbnail
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(11),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      image = await pickImage();
                      isThumbnailSelected = true;
                      setState(() {});
                    },
                    child: const Text(
                      "Chọn thumbnail",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              isThumbnailSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Image.file(
                        image!,
                        cacheHeight: 160,
                        cacheWidth: 400,
                      ),
                    )
                  : const SizedBox(),
              isThumbnailSelected
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(11),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            String thumbnail = await putFileInStorage(
                                image, randomNumber, "image");
                            String videoUrl = await putFileInStorage(
                                widget.video, randomNumber, "video");
                            ref.watch(longVideoProvider).uploadVideoToFirestore(
                                videoUrl: videoUrl,
                                thumbnail: thumbnail,
                                title: titleController.text,
                                videoId: videoId,
                                datePublished: DateTime.now(),
                                userId: FirebaseAuth.instance.currentUser!.uid);
                          },
                          child: const Text(
                            "Đăng tải",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
