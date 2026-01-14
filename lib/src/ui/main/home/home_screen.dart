import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/bloc/comment_bloc/commen_bloc.dart';
import 'package:zetgram/src/model/cometn_model/coment_model.dart';
import 'package:zetgram/src/model/home_story_model/story_model.dart';
import 'package:zetgram/src/ui/main/notification/notification_screen.dart';

import '../../../bloc/post_bloc/post_bloc.dart';
import '../../../model/post_model/post_model.dart';
import '../../../repository/repository.dart';
import '../story_screen/story_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    AppImages.story1,
    AppImages.story2,
    AppImages.story3,
    AppImages.story4,
  ];

  List<String> names = ["Clark Am...", "Sam Di...", "Lady June", "Suny Luv"];

  List<dynamic> story = [
    {
      "name": "Sansa Indira",
      "img": AppImages.vid1,
      "text":
          "My last day for this year holiday! So excited to share my memories with you guys! 😁😍",
      "story": AppImages.history1,
    },
    {
      "name": "Samuel Lannister",
      "img": AppImages.vid2,
      "text":
          "Just enjoying a cup of coffee with my brothers today. How’s your day?",
      "story": AppImages.history2,
    },
  ];

  @override
  void initState() {
    super.initState();
    contactBlocPost.getAllPost();
    contactBlocComment.getAllComment();
  }

  bool isLiked = false;
  TextEditingController controller = TextEditingController();
  List<HomeStoryModel> homeStoryModel = [
    HomeStoryModel(image: AppImages.img, name: "Clark Am..."),
    HomeStoryModel(image: AppImages.three, name: "Sam Di..."),
    HomeStoryModel(image: AppImages.twelve, name: "Lady June"),
    HomeStoryModel(image: AppImages.one, name: "Suny Luv"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text("Home"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => NotificationScreen()),
              );
            },
            child: Image.asset(AppIcons.bell),
          ),
          Gap(20.w),
        ],
      ),
      body: Column(
        children: [
          // story
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Add story
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              dashPattern: [8, 6],
                              strokeWidth: 3,
                              padding: EdgeInsets.all(10),
                              color: Colors.blueAccent,
                              radius: Radius.circular(10),
                            ),
                            child: Image.asset(AppIcons.add, height: 50),
                          ),
                          Gap(5),
                          Text(
                            "Add Story",
                            style: AppStyle.agRegularBody(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }

                  final storyIndex = index - 1; // 🔑

                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (storyIndex >= homeStoryModel.length)
                              return; // crash oldini olish
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoryScreen(
                                  homeStoryModel:
                                      homeStoryModel[storyIndex], // ✅ to‘g‘ri index
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 3),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(images[storyIndex]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        Gap(5),
                        SizedBox(
                          width: 70,
                          child: Text(
                            names[storyIndex],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.agRegularBody(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // import larni o'zgartirmang
          Expanded(
            child: StreamBuilder<List<PostModel>>(
              stream: contactBlocPost.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Can't find post"));
                }

                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 30,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // HEADER
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Image.asset(
                                      AppImages.profile,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    "Wendy Edwards",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Image.asset(AppIcons.vertical_dot),
                                ],
                              ),

                              const SizedBox(height: 15),
                              Divider(color: Colors.grey.shade400),
                              const SizedBox(height: 10),

                              // TEXT
                              Text(
                                post.text,
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const SizedBox(height: 10),

                              // IMAGE
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(post.image),
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 10),

                              // ACTIONS
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLiked = !isLiked;
                                        post.like += isLiked ? 1 : -1;
                                      });

                                      // DB ga saqlash
                                      await RepositoryPost().updateLike(
                                        post.id!,
                                        post.like,
                                      );
                                    },
                                    icon: Image.asset(
                                      isLiked
                                          ? AppIcons.active_favorite
                                          : AppIcons.favorite,
                                    ),
                                  ),
                                  Text(post.like.toString()),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () async {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (_) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context).viewInsets.bottom,
                                            ),
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.75,
                                              padding: const EdgeInsets.all(20),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                              ),
                                              child: Column(
                                                children: [
                                                  /// COMMENTS
                                                  Expanded(
                                                    child: StreamBuilder<List<CommentModel>>(
                                                      stream: contactBlocComment.stream,
                                                      builder: (context, snapshot) {
                                                        contactBlocComment.getAllComment();
                                                        final comments = snapshot.data!;
                                                        if (comments.isEmpty) {
                                                          return const Center(
                                                            child: Text("No comments yet"),
                                                          );
                                                        }
                                                        return ListView.builder(
                                                          itemCount: comments.length,
                                                          itemBuilder: (context, index) {
                                                            final comment = comments[index];
                                                            return Padding(
                                                              padding: const EdgeInsets.only(bottom: 12),
                                                              child: Row(
                                                                children: [
                                                                  /// AVATAR
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    clipBehavior: Clip.hardEdge,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(40),
                                                                    ),
                                                                    child: Image.asset(
                                                                      AppImages.profile,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(width: 10),

                                                                  /// TEXTS
                                                                  Expanded(
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          "Wendy Edwards",
                                                                          style: AppStyle.agBoldH3(
                                                                            color: Colors.black,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          comment.text,
                                                                          style: AppStyle.agSemiBoldContent(color: Colors.black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),

                                                  /// INPUT
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: TextField(
                                                            controller: controller,
                                                            decoration: const InputDecoration(
                                                              hintText: "Write a comment...",
                                                              border: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: const Icon(Icons.send),
                                                          onPressed: () async {
                                                            if (controller.text.isEmpty) return;

                                                            final comment = CommentModel(
                                                              text: controller.text,
                                                              postId: post.id!,
                                                            );

                                                            await RepositoryComment().saveComment(comment);
                                                            contactBlocComment.getAllComment();
                                                            controller.clear();
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Image.asset(AppIcons.message),
                                  ),
                                  StreamBuilder(
                                    stream: contactBlocComment.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final comment = snapshot.data!;
                                        return Text("${comment.length}");
                                      } else {
                                        return Text("0");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
