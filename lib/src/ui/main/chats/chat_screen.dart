import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/ui/main/chats/chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

List chat = [
  {
    "pic": AppImages.chat_image1,
    "name": "Mike Renly",
    "title": "Yes of course, I like that very much!",
  },
  {
    "pic": AppImages.vid1,
    "name": "Sansa Indira",
    "title": "I’m okay, how about you?",
  },
  {
    "pic": AppImages.chat_image3,
    "name": "Robb Jamie",
    "title": "Can your friends do it tonight?",
  },
  {
    "pic": AppImages.vid2,
    "name": "Samuel Seaworth",
    "title": "It’s pretty cheap I think and so ...",
  },
  {
    "pic": AppImages.user,
    "name": "Michael Snow",
    "title": "I’m at the office right now.",
  },
  {"pic": AppImages.chat_image2, "name": "Jorge Cooper", "title": "Hello"},
];

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Chats", style: AppStyle.agBoldH1(color: Colors.black)),
        actions: [Image.asset(AppIcons.vertical_dot), Gap(10)],
      ),
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    setState(() {
                      chat.removeAt(index);
                    });
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ChatDetailScreen(name: chat[index]["name"], pic: chat[index]["pic"],),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(chat[index]["pic"], fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat[index]["name"],
                            style: AppStyle.agBoldLabel(color: Colors.black),
                          ),
                          Text(
                            chat[index]["title"],
                            style: AppStyle.agSemiBoldContent(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
