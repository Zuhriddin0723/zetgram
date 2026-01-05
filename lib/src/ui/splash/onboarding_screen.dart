import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zetgram/src/app_theme/app_images.dart';
import 'package:zetgram/src/app_theme/app_style.dart';
import 'package:zetgram/src/ui/auth/login_screen.dart';
import 'package:zetgram/src/widget/button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: _controller,
            children: [
              _buildPage(
                context: context,
                image: AppImages.on1,
                title: "We Connect People",
                subtitle:
                    "Connecting people trough one platform to share the memories together.",
                buttonText: "Next",
                onTap: () => _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
              _buildPage(
                context: context,
                image: AppImages.on2,
                title: "Sharing Happiness",
                subtitle: "Sharing happiness by sharing your memories in Zelio platform.",
                buttonText: "Next",
                onTap: () => _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
              _buildPage(
                context: context,
                image: AppImages.on3,
                title: "Last Long Memories",
                subtitle: "You can store memories of your photos in Zelio app without limit.",
                buttonText: "Get Started",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => LoginScreen()),
                        (route) => false,
                  );
                },
              ),
            ],
          ),

          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey.shade400,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onTap,
  }) {

    return Column(
      children: [
        Image.asset(image, width: 1.sw, fit: BoxFit.contain),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Gap(20),
              Text(
                title,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: AppStyle.agBoldH2(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppStyle.agRegularLabel(color: Colors.grey.shade700),
                ),
              ),
              Gap(150),
              ButtonWidget(onTap: onTap, buttonText: buttonText)
            ],
          ),
        ),
      ],
    );
  }
}
