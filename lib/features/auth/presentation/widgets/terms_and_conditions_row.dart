

import 'package:flutter/material.dart';
import '../../../../core/commons/functions/common_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/login_cubit/login_cubit.dart';

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({
    super.key,
    required this.loginCubit,
  });

  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ()
          {
            loginCubit.changeTermsCheckBoxValue();
          }, child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(2),
              border: Border.all(
                  color: AppColors.c959895)),
          child: loginCubit.termsCheckBoxValue==true?
          const Icon(Icons.check,color: AppColors.c060606,size: 17,):const SizedBox.shrink(),
        ),
        ),
        const SpaceWidget(
          width: 8,
        ),
        Text(
          'Terms & Conditions ',
          style:
          AppTextStyles.regular16(context).copyWith(
              color: AppColors.c959895,
              fontFamily: 'Poppins'
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: ()
          {
            buildScaffoldMessenger(context: context, msg: 'This feature is locked for admin flow right now');
          },
          child: Text(
            'Forgot Password',
            style:
            AppTextStyles.regular16(context).copyWith(
                color: AppColors.primaryColor,
                fontFamily: 'Poppins'

            ),
          ),
        ),
      ],
    );
  }
}