import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetgram/src/ui/main/chats/chat_screen.dart';
import 'package:zetgram/src/ui/main/explore/explore_screen.dart';
import 'package:zetgram/src/ui/main/home/home_screen.dart';
import 'package:zetgram/src/ui/main/profile/profile_screen.dart';
import 'package:zetgram/src/ui/upload_post/upload_post_screen.dart';

import '../../app_theme/app_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ExploreScreen(),
    UploadPostScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: pages[currentIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 30.h),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => UploadPostScreen()),
            );
          },
          backgroundColor: Colors.blue,
          // AppColors.primary100
          elevation: 4,
          shape: const CircleBorder(),
          child: Image.asset(AppIcons.add, color: Colors.white),
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: BottomAppBar(
            height: 70.h,
            color: Colors.white,
            notchMargin: 10,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, AppIcons.home),
                _buildNavItem(1, AppIcons.send),
                SizedBox(width: 40.w),
                _buildNavItem(3, AppIcons.mail),
                _buildNavItem(4, AppIcons.user),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String icon) {
    bool isSelected = currentIndex == index;
    return InkWell(
      onTap: () => setState(() => currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            color: isSelected ? Colors.black : Colors.grey.shade600,
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4.h),
              height: 6.h,
              width: 6.h,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
