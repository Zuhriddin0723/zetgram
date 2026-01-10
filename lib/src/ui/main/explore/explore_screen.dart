import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<String> img=[
    AppImages.one,
    AppImages.two,
    AppImages.three,
    AppImages.four,
    AppImages.five,
    AppImages.six,
    AppImages.seven,
    AppImages.eight,
    AppImages.nine,
    AppImages.ten,
    AppImages.eleven,
    AppImages.twelve,
    AppImages.one_,
    AppImages.two_,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text("Explore",style: AppStyle.agBoldH3(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset(AppIcons.search)),
          Gap(10.w),
        ],
      ),
      body: Column(
        children: [
          Gap(20.w),
          Expanded(
            child: SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(img.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Image.asset(
                        img[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
