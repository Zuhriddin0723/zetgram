import 'dart:ui' as BorderType;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    AppImages.story1,
    AppImages.story2,
    AppImages.story3,
    AppImages.story4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Image.asset(AppIcons.bell),
          Gap(20.w)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: [8, 6],
                    strokeWidth: 3,
                    padding: EdgeInsets.all(10),
                    color: Colors.blueAccent,
                    radius: Radius.circular(10),
                  ),
                  child: Image.asset(AppIcons.add,height: 50,)
                ),
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 70,
                            height: 60,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue,
                                width: 3
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          )
                        );
                      },
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
