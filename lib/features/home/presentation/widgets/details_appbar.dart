import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../core/constants/app_assets/assets_icons.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../helpers/ui_helper.dart' show UIHelper;

AppBar detailsAppbar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back_ios_new, color: AppColors.c838383),
    ),
    titleSpacing: 0,
    title: Row(
      children: [
        Image.asset(AssetsIcons.home, height: 25),
        UIHelper.horizontalSpace(8.w),
        Text('Home', style: TextFontStyle.headline24w300c000000),
      ],
    ),
    actions: [
      Container(
        width: 70.w,
        height: 26.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text('Good', style: TextFontStyle.headline12w600cWhite),
      ),
    ],
  );
}
