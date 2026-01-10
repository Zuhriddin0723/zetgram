import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

bool isSwitched = false;

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Settings", style: AppStyle.agBoldH1(color: Colors.black)),
        actions: [
          Image.asset(AppIcons.vertical_dot, color: Colors.black),
          Gap(20.w),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Account", style: AppStyle.agBoldH4(color: Colors.black)),
            Gap(20.w),
            _listTile("Personal Information", () {}),
            Gap(20.w),
            _listTile("Language", () {}),
            Gap(20.w),
            _listTile("Liked Post", () {}),
            Gap(20.w),
            Text("Preferences", style: AppStyle.agBoldH4(color: Colors.black)),
            Gap(20.w),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(
                    "Notification",
                    style: AppStyle.agBoldLabel(color: Colors.black),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Gap(20.w),
            _listTile("Actions", () {}),
            Gap(20.w),
            Text("Security", style: AppStyle.agBoldH4(color: Colors.black)),
            Gap(20.w),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(
                    "Private Account",
                    style: AppStyle.agBoldLabel(color: Colors.black),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile(String name, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Text(name, style: AppStyle.agBoldLabel(color: Colors.black)),
              const Spacer(),
              Image.asset(AppIcons.right, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
