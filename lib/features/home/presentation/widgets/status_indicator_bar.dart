import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusIndicatorBar extends StatelessWidget {
  const StatusIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: barSegment(Colors.primaries[index],),
          );
        }),
      ),
    );
  }

  Widget barSegment(Color color) {
    return Container(width: 20.w, height: 8.h, color: color);
  }
}
