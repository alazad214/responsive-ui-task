import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';

class CustomPhoneField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final PhoneController? controller;
  final bool enabled;
  final FocusNode? focusNode;
  final Function(PhoneNumber?)? onChanged;
  final PhoneNumber? initialValue;
  final String? Function(PhoneNumber?)? validator;

  const CustomPhoneField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.focusNode,
    this.onChanged,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,
      focusNode: focusNode,

      decoration: InputDecoration(
        labelText: labelText ?? "Phone Number",
        hintText: hintText ?? "17XXXXXXXX",
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.c000000,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.cD6D6D6,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFADADAD)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFADADAD), width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      ),
      countrySelectorNavigator: CountrySelectorNavigator.bottomSheet(),
      autovalidateMode: AutovalidateMode.disabled,
      validator:
          validator != null ? (phoneNumber) => validator!(phoneNumber) : null,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.c000000,
      ),
      onChanged: onChanged,
    );
  }
}
