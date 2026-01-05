import 'package:flutter/material.dart';
import 'package:zetgram/src/app_theme/app_style.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback onTap;
  String buttonText;
  ButtonWidget({super.key,required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.blueAccent,
        ),
        child: Center(child: Text(buttonText,style: AppStyle.agBoldButton(color: Colors.white),)),
      ),
    );
  }
}
