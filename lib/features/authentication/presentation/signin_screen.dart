import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:m360_ict_task/common_widgets/custom_button.dart';
import 'package:m360_ict_task/common_widgets/custom_textfeild.dart';
import 'package:m360_ict_task/core/constants/app_assets/assets_icons.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/features/authentication/controller/login_controller.dart';
import 'package:m360_ict_task/features/authentication/presentation/send_otp_screen.dart';
import 'package:m360_ict_task/features/authentication/presentation/signup_screen.dart';
import 'package:m360_ict_task/features/authentication/presentation/widgets/social_icon.dart';
import 'package:m360_ict_task/features/home/presentation/home_screen.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import '../../../common_widgets/powered_by_text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final SignInController controller = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(UIHelper.defaultPadding()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign In', style: TextFontStyle.headline30w30c000000),
                  UIHelper.verticalSpace(8.h),
                  Text(
                    "Let's save environment together",
                    style: TextFontStyle.headline14w400c1F2937,
                  ),
                  UIHelper.verticalSpaceLarge,

                  //Email Field-->>
                  CustomTextfield(
                    hintText: 'user@example.com',
                    labelText: 'Email',
                  ),

                  UIHelper.verticalSpace(16.h),

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

                  UIHelper.verticalSpace(8.h),

                  //Remember Me & Forget Password-->
                  buildRememberMe(),
                  UIHelper.verticalSpace(24.h),

                  //Sign In Button-->>
                  customButton(
                    name: 'Sign In',
                    onCallBack: () {
                      Get.to(() => HomeScreen());
                    },
                    context: context,
                  ),

                  UIHelper.verticalSpace(24.h),
                  Center(
                    child: Text(
                      'Or Sign In with',
                      style: TextFontStyle.headline12w400cADADAD,
                    ),
                  ),
                  UIHelper.verticalSpace(22.h),

                  //Social Login Icon-->>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialIcon(assetPath: AssetsIcons.google, ontap: () {}),
                      SizedBox(width: 16.w),
                      socialIcon(assetPath: AssetsIcons.facebook, ontap: () {}),
                      SizedBox(width: 16.w),
                      socialIcon(
                        assetPath: AssetsIcons.microsoft,
                        ontap: () {},
                      ),
                      SizedBox(width: 16.w),
                      socialIcon(assetPath: AssetsIcons.apple, ontap: () {}),
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,

                  //Don't have an account-->>
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextFontStyle.headline12w400cADADAD,
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextFontStyle.headline14w700primaryColor,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(() => SignupScreen());
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(100),
              powerByText(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.rememberMe.value,
                onChanged: (value) {
                  controller.rememberMe.value = value ?? false;
                },
              ),
            ),

            Text('Remember me', style: TextFontStyle.headline14w400c1F2937),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.to(() => SendOtpScreen());
          },
          child: Text(
            'Forgotten Password',
            style: TextFontStyle.headline14w700primaryColor,
          ),
        ),
      ],
    );
  }
}
