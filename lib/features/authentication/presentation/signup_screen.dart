import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:m360_ict_task/common_widgets/custom_button.dart';
import 'package:m360_ict_task/common_widgets/custom_phonefield.dart';
import 'package:m360_ict_task/common_widgets/custom_textfeild.dart';
import 'package:m360_ict_task/core/constants/app_assets/assets_icons.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/core/constants/text_font_style.dart';
import 'package:m360_ict_task/core/constants/textfield_validation.dart';
import 'package:m360_ict_task/features/authentication/presentation/signin_screen.dart';
import 'package:m360_ict_task/features/authentication/presentation/widgets/social_icon.dart';
import 'package:m360_ict_task/helpers/ui_helper.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../common_widgets/powered_by_text.dart';
import 'package:flutter/gestures.dart';
import 'package:get/route_manager.dart';
import '../controller/signup_controlloer.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final SignupControlloer controller = SignupControlloer();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                    Text('Sign Up', style: TextFontStyle.headline30w30c000000),
                    UIHelper.verticalSpace(8.h),
                    Text(
                      "Let’s save environment together",
                      style: TextFontStyle.headline14w400c1F2937,
                    ),
                    UIHelper.verticalSpace(12.h),

                    //Name Field-->>
                    CustomTextfield(
                      hintText: 'e.g: Ahmed Ariyan',
                      labelText: 'Name',
                      validator: InputValidator.validateUsername,
                    ),
                    UIHelper.verticalSpace(12.h),

                    //Phone Field-->>
                    CustomPhoneField(initialValue: PhoneNumber.parse('+880')),
                    UIHelper.verticalSpace(12.h),
                    //Email Field-->>
                    CustomTextfield(
                      hintText: 'user@example.com',
                      labelText: 'Email',
                      validator: InputValidator.emailValidate,
                      onChanged: (value) {
                        controller.email.value = value;
                      },
                    ),

                    UIHelper.verticalSpace(12.h),

                    //Password Field-->>
                    Obx(
                      () => CustomTextfield(
                        hintText: '**********',
                        labelText: 'Password',
                        isObsecure: controller.isSecured.value,
                        validator: InputValidator.passwordValidate,
                        onChanged: (value) {
                          controller.password.value = value;
                        },
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
                        validator: InputValidator.confirmPassValidate,
                        onChanged: (value) {
                          controller.confirmPassword.value = value;
                        },
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

                    UIHelper.verticalSpace(32.h),

                    //Sign Up Button-->>
                    Obx(() {
                      return controller.isLoading.value
                          ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                          : customButton(
                            name: 'Sign Up',
                            onCallBack: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                controller.signupFunc();
                              }
                            },
                            context: context,
                          );
                    }),

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
                        socialIcon(
                          assetPath: AssetsIcons.facebook,
                          ontap: () {},
                        ),
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
                          text: 'Already have an account? ',
                          style: TextFontStyle.headline12w400cADADAD,
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextFontStyle.headline14w700primaryColor,
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => SignInScreen());
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(40.h),
                powerByText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
