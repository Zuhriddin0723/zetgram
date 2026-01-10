import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/model/chat_model/chat_mode.dart';
import 'package:zetgram/src/repository/repository.dart';

import '../../../bloc/chat_bloc/chat_bloc.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String pic;

  const ChatDetailScreen({super.key, required this.name, required this.pic});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

TextEditingController controllerChat = TextEditingController();

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  void initState() {
    super.initState();
    contactBlocChat.getAllChat(); // 🔥 SHART
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset(widget.pic, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: AppStyle.agBoldLabel(color: Colors.black),
                  ),
                  Text(
                    "@snowmichael09",
                    style: AppStyle.agRegularContent(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ChatModel>>(
              stream: contactBlocChat.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                          top: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onLongPress: () {
                              showDeleteDialog(
                                context,
                                data[index].id,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                data[index].text,
                                style: AppStyle.agSemiBoldContent(color: Colors.white),
                              ),
                            ),
                          )
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Chat not found"));
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.shade300,
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppIcons.smile),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controllerChat,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type your messages ...",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (controllerChat.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please type the message"),
                                  backgroundColor: Colors.redAccent,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              );
                            } else {
                              RepositoryChat repo = RepositoryChat();
                              ChatModel data = ChatModel(
                                text: controllerChat.text,
                              );
                              repo.saveChat(data);
                              await contactBlocChat.getAllChat();
                              controllerChat.clear();
                            }
                          },
                          child: Image.asset(AppIcons.send),
                        ),
                        Gap(10.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> showDeleteDialog(
      BuildContext context,
      dynamic chatId,
      ) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Delete message?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "Are you sure you want to delete this message?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ❌ faqat dialog yopiladi
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                RepositoryChat repo = RepositoryChat();
                await repo.deleteChat(chatId);

                contactBlocChat.getAllChat(); // 🔥 UI refresh
                Navigator.pop(context); // dialog yopiladi
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

}
