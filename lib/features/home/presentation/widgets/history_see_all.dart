  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';

Row historySeeAll({ontap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('History', style: TextFontStyle.headline16w400c838383),
        InkWell(
          onTap: ontap ?? () {},
          child: Row(
            children: [
              Text(
                'See all',
                overflow: TextOverflow.ellipsis,
                style: TextFontStyle.headline16w400c838383.copyWith(
                  color: AppColors.cADADAD
                ),
              ),
              Icon(Icons.arrow_right, size: 30.sp, color:AppColors.cADADAD),
            ],
          ),
        ),
      ],
    );
  }