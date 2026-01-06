import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/widget/button_widget.dart';
import 'package:zetgram/src/widget/text_field_widget.dart';

class ResetPw extends StatefulWidget {
  const ResetPw({super.key});

  @override
  State<ResetPw> createState() => _ResetPwState();
}

class _ResetPwState extends State<ResetPw> {
  TextEditingController controllerPw = TextEditingController();
  TextEditingController controllerConiformPw = TextEditingController();
  @override
  void initState() {
    super.initState();
    controllerPw.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text("Reset Password"),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20.w),
            Center(child: Image.asset(AppImages.logo2)),
            Gap(30.w),
            Text(
              "Set your new password for your account so you can login and access all the features in Zelio App.",
              style: AppStyle.agRegularLabel(color: Colors.grey.shade600),
            ),
            Gap(20.w),
            Text("Password",style: AppStyle.agSemiBoldLabel(color: Colors.black),),
            Gap(20.w),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff9393931A),
                    blurRadius: 7,
                    offset: Offset(0, 1),
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: controllerPw,
                      textAlignVertical: TextAlignVertical.center, // MUHIM
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        suffixIcon:  controllerPw.text.length >= 8
                      ? Image.asset(AppIcons.check_,color: Colors.green,)
                          : Image.asset(AppIcons.x_,color: Colors.red,),
                      ),
                    ),
                  )

              ),
            ),
            Gap(20.w),
            Text("Confirm Password",style: AppStyle.agSemiBoldLabel(color: Colors.black)),
            Gap(20.w),
            TextFieldWidget(
              controller: controllerConiformPw,
              hintText: "Enter your password",
              obscureText: true,
            ),
            Gap(40.w),
            ButtonWidget(onTap: (){}, buttonText: "Reset Password")
          ],
        ),
      ),
    );
  }
}
