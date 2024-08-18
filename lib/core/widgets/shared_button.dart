
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';


class SharedButton extends StatelessWidget {
  const SharedButton({super.key, required this.btnText, this.btnTextStyle, this.borderRadiusValue, this.btnColor, this.btnSize, this.onPressessed,});

  final String btnText;
  final TextStyle? btnTextStyle;
  final double? borderRadiusValue;
  final WidgetStateProperty<Color?>? btnColor;
  final WidgetStateProperty<Size?>? btnSize;
  final void Function()? onPressessed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
        fixedSize: btnSize?? const WidgetStatePropertyAll(Size.fromHeight(62)),
        backgroundColor: btnColor?? const WidgetStatePropertyAll(AppColors.primaryColor),
        shape: WidgetStatePropertyAll(
           RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue??12),

          ),
        )
      ),
        onPressed: onPressessed, child: Text(btnText,style: btnTextStyle??AppTextStyles.bold16(context).copyWith(
      color: AppColors.white,
    ),));
  }
}
