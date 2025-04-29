import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import '../../../../core/constants/app_assets/assets_image.dart';
import '../../../../core/constants/text_font_style.dart';

Container headerCard() {
  return Container(
    height: 190.h,
    padding: EdgeInsets.all(UIHelper.defaultPadding()),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AssetsImage.homeHeaderBG),
        fit: BoxFit.cover,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextFontStyle.headline16w300c838383,
                  ),

                  Text(
                    'Ahmed Ariyan',
                    style: TextFontStyle.headline24w500c1E1E1E,
                  ),
                ],
              ),

              Text.rich(
                TextSpan(
                  text: 'You are in a ',
                  style: TextFontStyle.headline14w300c838383,
                  children: [
                    TextSpan(
                      text: 'healthy ',
                      style: TextFontStyle.headline14w700primaryColor,
                    ),
                    TextSpan(
                      text: 'environment',
                      style: TextFontStyle.headline14w300c838383,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CircleAvatar(radius: 45.r, child: Image.asset(AssetsImage.avatar)),
      ],
    ),
  );
}
