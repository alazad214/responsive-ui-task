 import 'package:flutter/material.dart' show BoxDecoration, Colors, Container;
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../core/constants/app_assets/assets_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';

Container plantCard() {
    return Container(
              height: 140.h,
              width: double.infinity,

              decoration: BoxDecoration(
                color: AppColors.cWhite,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(blurRadius: 0.5, color: Colors.black12),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Plants',
                          style: TextFontStyle.headline24w500c1E1E1E.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),

                        Image.asset(AssetsImage.plant, height: 55),
                      ],
                    ),
                  ),
                  Container(
                    height: 140.h,
                    width: Get.width / 2.4,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        colors: [AppColors.c6ABC93, AppColors.cA1FFD0],
                      ),
                    ),
                    child: Text(
                      '5',
                      style: TextFontStyle.headline48w700c000000.copyWith(
                        fontSize: 80.sp,
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
