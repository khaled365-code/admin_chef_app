


import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomOulinedTextField extends StatelessWidget {
  const CustomOulinedTextField({super.key, this.validator, this.cursorColor, required this.controller, this.contentPadding, this.fillColor, this.hintText, this.labelText, this.floatingLabelBehavior, this.onFieldSubmitted, this.keyboardInputType});

  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Color? cursorColor;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final String? hintText,labelText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType? keyboardInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardInputType??TextInputType.text,
      onFieldSubmitted: (value){},
      validator: validator,
      cursorColor: cursorColor??AppColors.primaryColor,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding??const EdgeInsetsDirectional.only(start: 10),
        floatingLabelStyle: AppTextStyles.regular16(context).copyWith(
          color: AppColors.c959895,
        ),
        fillColor: fillColor??AppColors.white,
        filled: true,
        labelStyle: AppTextStyles.regular16(context).copyWith(
          color: AppColors.c32343E,
        ),
        hintStyle: AppTextStyles.regular14(context).copyWith(
            color: AppColors.cA0A5BA
        ),
        hintText: hintText,
        floatingLabelBehavior: floatingLabelBehavior,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            )
        ),
        labelText: labelText,

      ),
    );
  }
}
