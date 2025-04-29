import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/header_card.dart';
import 'package:m360_ict_task/features/home/presentation/widgets/place_card.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import '../data/place_data.dart';

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
                  ListView.builder(
                    itemCount: placeData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    itemBuilder: (_, index) {
                      final data = placeData[index];
                      return placeCard(
                        title: data['title'],
                        ppm: data['ppm'],
                        status: data['status'],
                        percentage: "${data['percentage']}%",
                        avatarCount: data['avatarCount'],
                      );
                    },
                  ),

                  UIHelper.verticalSpace(20.h),
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
}
