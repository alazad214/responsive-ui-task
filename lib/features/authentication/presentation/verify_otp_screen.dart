import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360_ict_task/common_widgets/custom_button.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/features/authentication/presentation/reset_password_screen.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../common_widgets/powered_by_text.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
              Text('Verify OTP', style: TextFontStyle.headline30w30c000000),
              UIHelper.verticalSpace(8.h),
              Text(
                "Recover your account in easy steps",
                style: TextFontStyle.headline14w400c1F2937,
              ),
              UIHelper.verticalSpace(35.h),
              RichText(
                text: TextSpan(
                  text: 'An email has been sent to ',
                  style: TextFontStyle.headline14w400c1F2937.copyWith(
                    color: AppColors.c838383,
                  ),
                  children: [
                    TextSpan(
                      text: 'user@example.com. ',
                      style: TextFontStyle.headline14w700primaryColor.copyWith(
                        color: AppColors.c000000,
                      ),
                    ),
                    TextSpan(
                      text: 'Please enter the sent OTP.',
                      style: TextFontStyle.headline14w400c1F2937.copyWith(
                        color: AppColors.c838383,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(12.h),

              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 61.h,
                  fieldWidth: 64.w,

                  activeFillColor: AppColors.primaryColor,
                  inactiveFillColor: AppColors.primaryColor,
                  selectedFillColor: AppColors.primaryColor,
                  inactiveColor: Colors.black12,
                  inactiveBorderWidth: 1,
                  activeBorderWidth: 1,
                  activeColor: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  selectedColor: AppColors.primaryColor,
                  selectedBorderWidth: 1,
                  errorBorderColor: AppColors.primaryColor,
                  errorBorderWidth: 1,
                ),
                // controller: otpController,
                onCompleted: (v) {},
                onChanged: (value) {},
              ),
              UIHelper.verticalSpace(32.h),

              Center(
                child: customButton(
                  name: 'Verify OTP',
                  onCallBack: () {},
                  context: context,
                ),
              ),
              UIHelper.verticalSpace(20.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Didn’t Receive a code?  ',
                    style: TextFontStyle.headline12w400cADADAD,
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: TextFontStyle.headline14w700primaryColor,
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => ResetPasswordScreen());
                              },
                      ),
                    ],
                  ),
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
