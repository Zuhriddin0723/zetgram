import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zetgram/src/app_theme/app_icons.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/ui/auth/forgot_password.dart';
import 'package:zetgram/src/ui/main/main_screen.dart';
import 'package:zetgram/src/widget/button_widget.dart';
import 'package:zetgram/src/widget/text_field_widget.dart';

import '../../app_theme/app_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TabController controllerTab;
  int currentIndex = 0;

  // login
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  // register
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPw = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerTab = TabController(length: 2, vsync: this);
    controllerTab.addListener(() {
      setState(() {
        currentIndex = controllerTab.index;
      });
    });
  }

  @override
  void dispose() {
    controllerTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(80.h),
            Center(child: Image.asset(AppImages.logo2)),
            Gap(30),
            Row(
              children: [
                GestureDetector(
                  onTap: () => controllerTab.animateTo(0),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: currentIndex == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: currentIndex == 0
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
                SizedBox(width: 32.w),
                GestureDetector(
                  onTap: () => controllerTab.animateTo(1),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: currentIndex == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: currentIndex == 1
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                SizedBox(width: 23.w),
                Container(
                  width: 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: currentIndex == 0 ? Colors.blue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 83.w),
                Container(
                  width: 6.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: currentIndex == 1 ? Colors.blue : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            Gap(20.h),
            Expanded(
              child: TabBarView(
                controller: controllerTab,
                children: [
                  // Login form
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username or Email",
                        style: AppStyle.agSemiBoldLabel(color: Colors.black),
                      ),
                      Gap(20.w),
                      TextFieldWidget(
                        controller: controllerEmail,
                        hintText: "Enter your username or email",
                        obscureText: false,
                      ),
                      Gap(30.w),
                      Text(
                        "Password",
                        style: AppStyle.agSemiBoldLabel(color: Colors.black),
                      ),
                      Gap(20.w),
                      TextFieldWidget(
                        controller: controllerPassword,
                        hintText: "Enter your password",
                        obscureText: true,
                      ),
                      Gap(20.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Forget Password?",
                              style: AppStyle.agRegularDisplay(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(20.w),
                      ButtonWidget(onTap: () {
                        if(controllerPassword.text.isEmpty|| controllerPassword.text.isEmpty){
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => _buildErrorSheet(
                              title: "Fill all the place",
                              message: "Please fill all required fields",
                            ),
                          );
                          return;
                        }if (controllerPassword.text.length < 8) {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => _buildErrorSheet(
                              title: "Login Faild",
                              message:
                              "Password must be at least 8 characters long and contain at least 1 number.",
                            ),
                          );
                          return;
                        }
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => MainScreen()),
                              (route) => false,
                        );
                        controllerPassword.clear();
                        controllerEmail.clear();

                      }, buttonText: "Login"),
                      Gap(30.w),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey.shade600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Or login with",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Divider(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                      Gap(30.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppIcons.google),
                              Gap(15.w),
                              Text(
                                "Google",
                                style: AppStyle.agBoldButton(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SignUp form
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // username
                      Text(
                        "Username",
                        style: AppStyle.agSemiBoldLabel(color: Colors.black),
                      ),
                      Gap(20.w),
                      TextFieldWidget(
                        controller: _controllerName,
                        hintText: "Create your username",
                        obscureText: false,
                      ),
                      Gap(20.w),
                      // Email
                      Text(
                        "Email",
                        style: AppStyle.agSemiBoldLabel(color: Colors.black),
                      ),
                      Gap(20.w),
                      TextFieldWidget(
                        controller: _controllerEmail,
                        hintText: "Enter your email",
                        obscureText: false,
                      ),
                      Gap(20.w),
                      // password
                      Text(
                        "Password",
                        style: AppStyle.agSemiBoldLabel(color: Colors.black),
                      ),
                      Gap(20.w),
                      TextFieldWidget(
                        controller: _controllerPw,
                        hintText: "Create your password",
                        obscureText: true,
                      ),
                      Gap(40.w),
                      ButtonWidget(
                        onTap: () {
                          // 1️⃣ Bo‘sh fieldlar
                          if (_controllerEmail.text.isEmpty ||
                              _controllerName.text.isEmpty ||
                              _controllerPw.text.isEmpty) {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => _buildErrorSheet(
                                title: "Fill all the place",
                                message: "Please fill all required fields",
                              ),
                            );
                            return; // MUHIM
                          }

                          // 2️⃣ Password kuchsizmi?
                          if (_controllerPw.text.length < 8) {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => _buildErrorSheet(
                                title: "Password too weak",
                                message:
                                "Password must be at least 8 characters long and contain at least 1 number.",
                              ),
                            );
                            return;
                          }
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (ctx) => MainScreen()),
                                (route) => false,
                          );
                          _controllerEmail.clear();
                          _controllerName.clear();
                          _controllerPw.clear();
                        },
                        buttonText: "Sign Up",
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorSheet({required String title, String? message}) {
    return Container(
      width: MediaQuery.of(context).size.width, // full width
      padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.grey
            ),
          ),
          Gap(30.w),
          Image.asset(
            AppIcons.failed, // error icon
            height: 100,
            color: Colors.red,
          ),
          Gap(30.w),
          Text(
            title,
            style: AppStyle.agBoldH2(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          if (message != null) ...[
            Gap(20.w),
            Text(
              message,
              style: AppStyle.agRegularLabel(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
          Gap(50.w),
          ButtonWidget(
            onTap: () => Navigator.pop(context),
            buttonText: "Sign Up",
          ),
          Gap(30.w)
        ],
      ),
    );
  }

}