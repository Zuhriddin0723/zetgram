import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/ui/main/profile/settings/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

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

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text("Profile", style: AppStyle.agBoldH1(color: Colors.black)),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => SettingsScreen()),
              );
            },
            child: Image.asset(AppIcons.setting, color: Colors.black),
          ),
          Gap(20.w),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                        ),
                        child: Image.asset(
                          AppImages.profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80, left: 80),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset(
                            AppIcons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wendy Edwards",
                          style: AppStyle.agBoldH3(color: Colors.black),
                        ),
                        Text(
                          "@wendy10edwards",
                          style: AppStyle.agSemiBoldLabel(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          "Jakarta, Indonesia",
                          style: AppStyle.agRegularContent(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
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
              Gap(20.w),
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
