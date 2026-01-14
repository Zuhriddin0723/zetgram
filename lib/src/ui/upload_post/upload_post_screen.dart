import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/model/post_model/post_model.dart';
import 'package:zetgram/src/repository/repository.dart';
import 'package:zetgram/src/widget/button_widget.dart';

import '../../bloc/post_bloc/post_bloc.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  final ImagePicker picker = ImagePicker();
  File? galleryFile;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.vertical_dot),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: galleryFile == null
                ? const Center(child: Text('No image selected'))
                : Container(
              width: 1.sw,
              height: 1.sw,
              child: Image.file(
                galleryFile!,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(20),
          ButtonWidget(
            onTap: () async {
              getImage(ImageSource.gallery);
            },
            buttonText: "Get Image Gallery",
          ),
          Gap(20.w),
          ButtonWidget(
            onTap: () async {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 130,
                              height: 3,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Gap(30),
                          Text("Write a Caption", style: AppStyle.agBoldH3(color: Colors.black)),
                          Gap(30),
                          TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: "Enter your caption here ...",
                            ),
                          ),
                          Gap(150),
                          ButtonWidget(
                            onTap: () {
                              if (controller.text.isEmpty || galleryFile == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please select image and caption"),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                              } else {
                                PostModel data = PostModel(
                                  text: controller.text,
                                  image: galleryFile!.path,
                                  time: DateTime.now().millisecondsSinceEpoch,
                                  like: 0,
                                  comment: 0,
                                );
                                RepositoryPost().savePost(data);
                                contactBlocPost.getAllPost();
                                Navigator.pop(context);
                                controller.clear();
                                setState(() => galleryFile = null);
                              }
                            },
                            buttonText: "Upload",
                          ),

                        ],
                      ),
                    ),
                  );
                },
              );
            },
            buttonText: "Next",
          ),
        ],
      ),
    );
  }

  Future<void> getImage(ImageSource img) async {
    final XFile? pickedFile = await picker.pickImage(
      source: img,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        galleryFile = File(pickedFile.path);
      });
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing selected')));
    }
  }
}
