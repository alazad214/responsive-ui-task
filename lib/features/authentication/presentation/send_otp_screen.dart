import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360_ict_task/common_widgets/custom_button.dart';
import 'package:m360_ict_task/common_widgets/custom_textfeild.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/features/authentication/presentation/verify_otp_screen.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import '../../../common_widgets/powered_by_text.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

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
              Text('Send OTP', style: TextFontStyle.headline30w30c000000),
              UIHelper.verticalSpace(8.h),
              Text(
                "Recover your account in easy steps",
                style: TextFontStyle.headline14w400c1F2937,
              ),
              UIHelper.verticalSpace(35.h),

              CustomTextfield(hintText: 'user@example.com', labelText: 'Email'),
              UIHelper.verticalSpace(40.h),

              Center(
                child: customButton(
                  name: 'Send OTP',
                  onCallBack: () {
                       Get.to(()=>VerifyOtpScreen());
                  },
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
