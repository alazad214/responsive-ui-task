import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict_task/core/constants/app_assets/assets_image.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/header_card.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Card-->>
            headerCard(),

            Padding(
              padding: EdgeInsets.all(UIHelper.defaultPadding()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My Places', style: TextFontStyle.headline16w300c838383),
                  UIHelper.verticalSpace(20.h),

                  //Home Place Card-->>
                  placeCard(
                    title: 'Home',
                    ppm: '652',
                    status: 'Good',
                    percentage: '+13%',
                    avatarCount: 3,
                  ),
                  UIHelper.verticalSpace(20.h),

                  //Office Place Card-->>
                  placeCard(
                    title: 'Office',
                    ppm: '447',
                    status: 'Healthy',
                    percentage: '+37%',
                    avatarCount: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, size: 30.sp, color: Colors.white),
      ),
    );
  }

  Widget placeCard({
    required String title,
    required String ppm,
    required String status,
    required String percentage,
    required int avatarCount,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextFontStyle.headline16w600c1F2937),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(status, style: TextFontStyle.headline12w600cWhite),
              ),
            ],
          ),

          UIHelper.verticalSpace(12.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ppm,
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.c00C569,
                ),
              ),

              UIHelper.horizontalSpace(8.w),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(avatarCount, (index) {
                      return Transform.translate(
                        offset: Offset(index == 0 ? 0 : -8.w, 0),
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundImage: AssetImage(AssetsImage.logo),
                          ),
                        ),
                      );
                    }),
                  ),

                  UIHelper.verticalSpace(8.h),

                  Row(
                    children: [
                      Text(
                        'View Details',
                        style: TextFontStyle.headline12w500primaryColor,
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 12.sp,
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
}
