import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

List notification = [
  {
    "pic": AppImages.chat_image1,
    "name": "Jacob Howard",
    "title": "Mentioned you",
    "text": "in a comment 'Hahaha, I forgot that lol.'",
    "time": "2 min",
  },
  {
    "pic": AppImages.vid1,
    "name": "Arthur Black",
    "title": "Liked your 2",
    "text": "photos.",
    "time": "10 min",
  },
  {
    "pic": AppImages.chat_image3,
    "name": "Diane Richards",
    "title": "Tagged you",
    "text": "and 3 others in his post.",
    "time": "5 hr",
  },
];

List notification2 = [
  {
    "pic": AppImages.vid2,
    "name": "Sansa Indira",
    "title": "Commented in",
    "text": "your post 'Have a nice day!'",
    "time": "Sun",
  },
  {
    "pic": AppImages.user,
    "name": "Davos Edwards",
    "title": "Liked your",
    "text": "photos.",
    "time": "Sat",
  },
  {
    "pic": AppImages.chat_image2,
    "name": "Jorge Cooper",
    "title": "Tagged you in",
    "text": "a post.",
    "time": "Sat",
  },
];

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Notifications"),
        actions: [Image.asset(AppIcons.vertical_dot), Gap(20.w)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today", style: AppStyle.agBoldH4(color: Colors.black)),
            Expanded(
              child: ListView.builder(
                itemCount: notification.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            notification[index]["pic"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    notification[index]["name"],
                                    style: AppStyle.agBoldContent(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Gap(5.w),
                                  Text(
                                    notification[index]["title"],
                                    style: AppStyle.agRegularContent(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    notification[index]["time"],
                                    style: AppStyle.agRegularDisplay(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                notification[index]["text"],
                                style: AppStyle.agRegularContent(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text("This week", style: AppStyle.agBoldH4(color: Colors.black)),
            SizedBox(
              height: 420,
              child: ListView.builder(
                itemCount: notification2.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset(
                            notification2[index]["pic"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    notification2[index]["name"],
                                    style: AppStyle.agBoldContent(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Gap(5.w),
                                  Text(
                                    notification2[index]["title"],
                                    style: AppStyle.agRegularContent(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    notification2[index]["time"],
                                    style: AppStyle.agRegularDisplay(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                notification2[index]["text"],
                                style: AppStyle.agRegularContent(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
