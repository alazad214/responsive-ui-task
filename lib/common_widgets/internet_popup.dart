import 'package:m360_ict_task/common_widgets/custom_button.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void internetPopup(
  BuildContext context,
  VoidCallback onRetry,
  VoidCallback onOfflineMode,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          height: 270,
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, color: Colors.red, size: 60),
              UIHelper.verticalSpace(5),
              Text('Whoops!', style: TextFontStyle.headline16w600c1F2937),
              UIHelper.verticalSpace(10),
              Text(
                'No Internet Connection found. \nCheck your connection & try again.',
                style: TextFontStyle.headline12w400cADADAD,
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(10),

              Row(
                children: [
                  Expanded(
                    child: customButton(
                      name: 'Retry',
                      onCallBack: () {
                        Navigator.of(context).pop();
                        onRetry();
                      },
                      context: context,
                    ),
                  ),
                  UIHelper.horizontalSpace(10),
                  Expanded(
                    child: customButton(
                      name: 'Offline Mode',
                      onCallBack: () {
                        Navigator.of(context).pop();
                        onOfflineMode();

                        Get.snackbar(
                          'Offline Mode Activated',
                          'You are now in offline mode.',
                          backgroundColor: AppColors.primaryColor,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      context: context,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
