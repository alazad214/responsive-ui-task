import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/buildPersonCard.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/details_appbar.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/history_chart.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/history_see_all.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/plant_card.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/status_indicator_bar.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import '../data/history_chart_data.dart';
import 'widgets/build_rooms_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppbar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "652",
                    style: TextStyle(
                      fontSize: 42.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.c00C569,
                    ),
                  ),
                  UIHelper.horizontalSpace(10.w),
                  Column(
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.cWhite,
                              size: 20.w,
                            ),
                            Text(
                              '37\$',
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
                  StatusIndicatorBar(),
                ],
              ),

              UIHelper.verticalSpace(24),
              historySeeAll(),

              //History Chart-->>
              HistoryChart(dataPoints: chartData, months: months, days: days),

              //Persons & Rooms Card-->>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 5.w,
                children: [buildPersonsCard(), buildRoomsCard()],
              ),
              UIHelper.verticalSpace(24),

              //Plant Card-->>
              plantCard(),
            ],
          ),
        ),
      ),
    );
  }
}
