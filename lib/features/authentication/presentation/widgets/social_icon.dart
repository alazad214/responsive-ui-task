 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import '../../../../core/constants/app_assets/assets_icons.dart';

Widget socialIcon({String? assetPath, ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColors.cWhite,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0.1, 0.1),
            ),
          ],
        ),
        child: Image.asset(
          assetPath ?? AssetsIcons.apple,
          height: 30.h,
          width: 30.h,
        ),
      ),
    );
  }
