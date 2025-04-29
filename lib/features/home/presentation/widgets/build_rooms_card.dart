
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';

Container buildRoomsCard() {
    return Container(
      height: 140.h,
      width: Get.width / 2.4,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [AppColors.c6ABC93, AppColors.cA1FFD0],
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Rooms',
            style: TextFontStyle.headline24w500c1E1E1E.copyWith(
              color: AppColors.cWhite,
            ),
          ),

          Text('5', style: TextFontStyle.headline48w700c000000),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.cWhite,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Text(
              '2 of them requires action',
              overflow: TextOverflow.ellipsis,
              style: TextFontStyle.headline10w500c1F2937.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
