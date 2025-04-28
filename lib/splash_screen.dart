import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/helpers/check_login_helper.dart';

import 'core/constants/app_assets/assets_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Image.asset(AssetsImage.logo, height: 100.h)),

          RichText(
            text: TextSpan(
              text: 'Powered by ',
              style: TextFontStyle.headline12w400cADADAD,
              children: [
                TextSpan(
                  text: 'M360 ICT',
                  style: TextFontStyle.headline14w700primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
