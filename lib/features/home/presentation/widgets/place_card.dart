 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets/assets_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../helpers/ui_helper.dart';

Widget placeCard({
    required String title,
    required String ppm,
    required String status,
    required String percentage,
    required int avatarCount,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 2,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(title, style: TextFontStyle.headline16w600c1F2937),
                  UIHelper.verticalSpace(20.h),
                  Text(
                    ppm,
                    style: TextStyle(
                      fontSize: 42.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.c00C569,
                    ),
                  ),
                ],
              ),
              UIHelper.horizontalSpace(8.w),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.cWhite,
                          size: 20.w,
                        ),
                        Text(
                          percentage,
                          style: TextFontStyle.headline12w600cWhite,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'ppm',
                    style: TextFontStyle.headline16w300c838383.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      status,
                      style: TextFontStyle.headline12w600cWhite,
                    ),
                  ),
                  UIHelper.verticalSpace(22.h),

                  Row(
                    children: [
                      for (int i = 0; i < 4; i++)
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
                              "+47",
                              style: TextFontStyle.headline12w600cWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  UIHelper.verticalSpace(8.h),

                  Row(
                    children: [
                      Text(
                        'View Details',
                        overflow: TextOverflow.ellipsis,
                        style: TextFontStyle.headline10w500c1F2937.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 20.sp,
                        color: AppColors.c00C569,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
