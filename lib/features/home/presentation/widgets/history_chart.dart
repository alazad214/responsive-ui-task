import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_font_style.dart';

class HistoryChart extends StatelessWidget {
  final List<FlSpot> dataPoints;
  final List<String> months;
  final List<String> days;

  const HistoryChart({
    super.key,
    required this.dataPoints,
    required this.months,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.white,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine:
                (_) => FlLine(color: Colors.grey.shade200, strokeWidth: 0.5),
            getDrawingVerticalLine:
                (_) => FlLine(color: Colors.grey.shade200, strokeWidth: 0.5),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 50.h,
                getTitlesWidget: (value, _) {
                  if (value >= 0 &&
                      value < months.length &&
                      value.toInt() < days.length) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          months[value.toInt()],
                          style: TextFontStyle.headline12w700cADADAD,
                        ),
                        Text(
                          days[value.toInt()],
                          style: TextFontStyle.headline12w700cADADAD,
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: Colors.grey, width: 0.5),
              bottom: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: AppColors.primaryColor,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeColor: AppColors.primaryColor,
                    strokeWidth: 1,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
              isStrokeCapRound: true,
              barWidth: 0.5,
            ),
          ],
          minY: 0,
          maxY: 7,
        ),
      ),
    );
  }
}
