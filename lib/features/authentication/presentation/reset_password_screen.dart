import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360_ict_task/common_widgets/custom_button.dart';
import 'package:m360_ict_task/common_widgets/custom_textfeild.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import '../../../common_widgets/powered_by_text.dart';
import '../../../core/constants/app_colors.dart' show AppColors;
import '../controller/signup_controlloer.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final SignupControlloer controller = SignupControlloer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.defaultPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(30.h),
              Text('Reset Password', style: TextFontStyle.headline30w30c000000),

              UIHelper.verticalSpace(35.h),

              //Password Field-->>
              Obx(
                () => CustomTextfield(
                  hintText: '**********',
                  labelText: 'Password',
                  isObsecure: controller.isSecured.value,
                  suffixIcon: IconButton(
                    onPressed: controller.isSecuredFunc,
                    icon: Icon(
                      controller.isSecured.value == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.cD6D6D6,
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(12.h),
              //Confirm Password Field-->>
              Obx(
                () => CustomTextfield(
                  hintText: '**********',
                  labelText: 'Confirm Password',
                  isObsecure: controller.isSecured2.value,
                  suffixIcon: IconButton(
                    onPressed: controller.isSecuredFunc2,
                    icon: Icon(
                      controller.isSecured2.value == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.cD6D6D6,
                    ),
                  ),
                ),
              ),
              UIHelper.verticalSpace(40.h),

              Center(
                child: customButton(
                  name: 'Reset Password',
                  onCallBack: () {},
                  context: context,
                ),
              ),

              Spacer(),

              Center(child: powerByText()),
            ],
          ),
        ),
      ),
    );
  }
}
