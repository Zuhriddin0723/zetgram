import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/ui/auth/verification_screen.dart';
import 'package:zetgram/src/widget/button_widget.dart';
import 'package:zetgram/src/widget/text_field_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "Forgot Password",
          style: AppStyle.agBoldH4(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppImages.logo2)),
            Gap(40.w),
            Text(
              "Enter your email for the verification proccess, and we will send 4 digits code to your email for the verification.",
              style: AppStyle.agRegularLabel(color: Colors.grey.shade600),
            ),
            Gap(40.w),
            Text("E-mail",style: AppStyle.agSemiBoldLabel(color: Colors.black),),
            Gap(20.w),
            TextFieldWidget(
              controller: controllerEmail,
              hintText: "Email",
              obscureText: false,
            ),
            Gap(50.w),
            ButtonWidget(onTap: (){
              if(controllerEmail.text.isNotEmpty){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>VerificationScreen()));
              }
            }, buttonText: "Continue")
          ],
        ),
      ),
    );
  }
}
