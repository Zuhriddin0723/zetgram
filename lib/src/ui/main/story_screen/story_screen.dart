import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../app_theme/app_images.dart';
import '../../../app_theme/app_style.dart';
import '../../../model/home_story_model/story_model.dart';
class StoryScreen extends StatefulWidget {
  final HomeStoryModel homeStoryModel;
  const StoryScreen({super.key, required this.homeStoryModel});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with TickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.img,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 12.h,
              left: 12.w,
              right: 12.w,
              child: LinearProgressIndicator(
                value: controller.value,
                color: Color(0xffA9A9A9),          // to‘layotgan qismi
                backgroundColor: Colors.white,    // orqa fon (oq)
              ),
            ),
            Positioned(
                top: 50.h,
                left: 12.w,
                right: 12.w,
                child:Row(
                  children: [
                    Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.homeStoryModel.image))
                      ),
                    ),
                    Gap(16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.homeStoryModel.name,style: AppStyle.agBoldLabel(color: Colors.white70),),
                        Text("@diane.richards.ofc",style: AppStyle.agRegularContent(color: Colors.grey.shade100),),
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}