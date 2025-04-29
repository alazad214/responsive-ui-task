 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../../../core/constants/app_assets/assets_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';

Container buildPersonsCard() {
    return Container(
      height: 140.h,
      width: Get.width / 2.4,
      decoration: BoxDecoration(
        color: AppColors.cWhite,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(blurRadius: 0.5, color: Colors.black12)],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Persons', style: TextFontStyle.headline24w500c1E1E1E),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Align(
                  widthFactor: .4,
                  child: CircleAvatar(
                    backgroundColor: AppColors.scaffoldBackground,
                    radius: 14.r,
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundImage: AssetImage(AssetsImage.avatar),
                    ),
                  ),
                ),
              Align(
                widthFactor: .4,
                child: CircleAvatar(
                  backgroundColor: AppColors.scaffoldBackground,
                  radius: 14.r,
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Colors.grey.shade400,
                    child: Text(
                      "+2",
                      style: TextFontStyle.headline12w600cWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
 
 
  }
