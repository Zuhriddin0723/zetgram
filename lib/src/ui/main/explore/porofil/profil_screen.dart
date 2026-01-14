import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';

class ProfilScreen extends StatefulWidget {
  final String name;
  final String pic;
  final String title;
  const ProfilScreen({
    super.key,
    required this.name,
    required this.pic,
    required this.title
  });

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}
bool isFollow = false;
List<String> img = [
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

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text("Profile",style: AppStyle.agBoldH1(color: Colors.black),),
        actions: [
          Image.asset(AppIcons.vertical_dot),
          Gap(10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80)
                    ),
                    child: Image.asset(widget.pic,fit: BoxFit.cover,),
                  ),
                  Column(
                    children: [
                      Text(widget.name,style: AppStyle.agBoldH3(color: Colors.black),),
                      Text(widget.title,style: AppStyle.agSemiBoldLabel(color: Colors.grey.shade800),),
                      Text("Jakarta, Indonesia",style: AppStyle.agRegularContent(color: Colors.grey.shade600),)
                    ],
                  )
                ],
              ),
              Gap(30.w),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Image.asset(AppIcons.message),
                  ),
                  Gap(30.w),

                  InkWell(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: isFollow ? Colors.transparent : Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blue, width: 3),
                      ),
                      child: Center(
                        child: Text(
                          isFollow ? "Following" : "Follow",
                          style: AppStyle.agBoldButton(
                            color: isFollow ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20.w),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Gap(25.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "890",
                              style: AppStyle.agBoldH3(color: Colors.black),
                            ),
                            Text(
                              "Likes",
                              style: AppStyle.agRegularContent(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Gap(50.w),
                        Column(
                          children: [
                            Text(
                              "1293",
                              style: AppStyle.agBoldH3(color: Colors.black),
                            ),
                            Text(
                              "Followers",
                              style: AppStyle.agRegularContent(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Gap(50.w),
                        Column(
                          children: [
                            Text(
                              "1436",
                              style: AppStyle.agBoldH3(color: Colors.black),
                            ),
                            Text(
                              "Following",
                              style: AppStyle.agRegularContent(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(img.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Image.asset(img[index], fit: BoxFit.cover),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
