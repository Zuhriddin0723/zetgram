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
  TextEditingController controllerRegEmail = TextEditingController();
  TextEditingController controllerRegName = TextEditingController();
  TextEditingController controllerRegPw = TextEditingController();

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60.h),
              Center(child: Image.asset(AppImages.logo2)),
              Gap(30),

              /// TAB TITLES
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controllerTab.animateTo(0),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight:
                        currentIndex == 0 ? FontWeight.bold : FontWeight.normal,
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
                        fontWeight:
                        currentIndex == 1 ? FontWeight.bold : FontWeight.normal,
                        color: currentIndex == 1
                            ? Colors.black
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(10),

              /// TAB VIEW
              Expanded(
                child: TabBarView(
                  controller: controllerTab,
                  children: [
                    /// ================= LOGIN =================
                    SingleChildScrollView(
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(20),
                          Text("Username or Email",
                              style:
                              AppStyle.agSemiBoldLabel(color: Colors.black)),
                          Gap(15),
                          TextFieldWidget(
                            controller: controllerEmail,
                            hintText: "Enter your username or email",
                            obscureText: false,
                          ),
                          Gap(25),
                          Text("Password",
                              style:
                              AppStyle.agSemiBoldLabel(color: Colors.black)),
                          Gap(15),
                          TextFieldWidget(
                            controller: controllerPassword,
                            hintText: "Enter your password",
                            obscureText: true,
                          ),
                          Gap(15),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ForgotPassword()),
                                );
                              },
                              child: Text(
                                "Forget Password?",
                                style: AppStyle.agRegularDisplay(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ),
                          Gap(25),
                          ButtonWidget(
                            buttonText: "Login",
                            onTap: () {
                              if (controllerEmail.text.isEmpty ||
                                  controllerPassword.text.isEmpty) {
                                _showError(
                                    "Fill all the place",
                                    "Please fill all required fields");
                                return;
                              }
                              if (controllerPassword.text.length < 8) {
                                _showError(
                                    "Login Failed",
                                    "Password must be at least 8 characters long");
                                return;
                              }

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const MainScreen()),
                                    (route) => false,
                              );
                            },
                          ),
                          Gap(40),
                        ],
                      ),
                    ),

                    /// ================= SIGN UP =================
                    SingleChildScrollView(
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(20),
                          Text("Username",
                              style:
                              AppStyle.agSemiBoldLabel(color: Colors.black)),
                          Gap(15),
                          TextFieldWidget(
                            controller: controllerRegName,
                            hintText: "Create your username",
                            obscureText: false,
                          ),
                          Gap(20),
                          Text("Email",
                              style:
                              AppStyle.agSemiBoldLabel(color: Colors.black)),
                          Gap(15),
                          TextFieldWidget(
                            controller: controllerRegEmail,
                            hintText: "Enter your email",
                            obscureText: false,
                          ),
                          Gap(20),
                          Text("Password",
                              style:
                              AppStyle.agSemiBoldLabel(color: Colors.black)),
                          Gap(15),
                          TextFieldWidget(
                            controller: controllerRegPw,
                            hintText: "Create your password",
                            obscureText: true,
                          ),
                          Gap(30),
                          ButtonWidget(
                            buttonText: "Sign Up",
                            onTap: () {
                              if (controllerRegName.text.isEmpty ||
                                  controllerRegEmail.text.isEmpty ||
                                  controllerRegPw.text.isEmpty) {
                                _showError(
                                    "Fill all the place",
                                    "Please fill all required fields");
                                return;
                              }
                              if (controllerRegPw.text.length < 8) {
                                _showError(
                                    "Password too weak",
                                    "Password must be at least 8 characters");
                                return;
                              }

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const MainScreen()),
                                    (route) => false,
                              );
                            },
                          ),
                          Gap(40),
                        ],
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
  }

  void _showError(String title, String message) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppIcons.failed, height: 80, color: Colors.red),
            Gap(20),
            Text(title, style: AppStyle.agBoldH2(color: Colors.black)),
            Gap(10),
            Text(message,
                style:
                AppStyle.agRegularLabel(color: Colors.grey.shade600)),
            Gap(20),
            ButtonWidget(
              buttonText: "OK",
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
