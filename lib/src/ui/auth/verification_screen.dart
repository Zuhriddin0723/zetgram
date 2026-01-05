import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/widget/button_widget.dart';

import '../../app_theme/app_style.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController textController = TextEditingController();
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text("Code Verification",
            style: AppStyle.agBoldH4(color: Colors.black)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.w),
            Center(child: Image.asset(AppImages.logo2)),
            Gap(30.w),
            Text(
              "Enter the 4 digits code that you received on your email so you can continue to reset your account password.",
              style: AppStyle.agRegularLabel(color: Colors.grey.shade600),
            ),
            Gap(40.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1st TextField
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  width: 50,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: TextField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    controller: textController,
                    focusNode: focusNode,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        FocusScope.of(context).requestFocus(focusNode1);
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: ""
                    ),
                  ),
                ),
                Gap(30.w),
                // 2nd TextField
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  width: 50,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: TextField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    controller: textController1,
                    focusNode: focusNode1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        FocusScope.of(context).requestFocus(focusNode2);
                      } else {
                        FocusScope.of(context).requestFocus(focusNode);
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: ""
                    ),
                  ),
                ),
                Gap(30.w),
                // 3rd TextField
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  width: 50,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: TextField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    controller: textController2,
                    focusNode: focusNode2,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        FocusScope.of(context).requestFocus(focusNode4);
                      } else {
                        FocusScope.of(context).requestFocus(focusNode1);
                      }
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: ""
                    ),
                  ),
                ),
                Gap(30.w),
                // 4th TextField
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  width: 50,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: TextField(
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    controller: textController4,
                    focusNode: focusNode4,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: ""
                    ),
                    onChanged: (text) {
                      if (text.isEmpty) {
                        FocusScope.of(context).requestFocus(focusNode2);
                      }
                    },
                  ),
                ),
              ],
            ),
            Gap(40.w),
            ButtonWidget(
                onTap: () {
              String phone = textController.text.trim().replaceAll(
                RegExp(r'\D'),
                '',
              );
              String phone2 = textController1.text.trim().replaceAll(
                RegExp(r'\D'),
                '',
              );
              String phone3 = textController2.text.trim().replaceAll(
                RegExp(r'\D'),
                '',
              );
              String phone5 = textController4.text.trim().replaceAll(
                RegExp(r'\D'),
                '',
              );
              if (phone.length != 1 ||
                  phone2.length != 1 ||
                  phone3.length != 1 ||
                  phone5.length != 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Sms Cod'ni Kiriting"),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
                return; // Navigatsiyani to‘xtatamiz
              }

              // Agar hammasi to‘g‘ri bo‘lsa, keyingi sahifaga o‘tamiz
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Column(),
                ),
              );
            },
                buttonText: "Continue"
            ),
          ],
        ),
      ),
    );
  }
}
