



import 'package:admin_chef_app/core/utillis/size_config.dart';
import 'package:flutter/cupertino.dart';

import 'fontweight_helper.dart';

class AppTextStyles
{
  static  TextStyle semiBold25(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, 25),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: 'Inter',
    );
  }
  static  TextStyle bold18(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, 18),
      fontWeight: FontWeightHelper.bold,
      fontFamily: 'Playfair Display',
    );
  }
  static  TextStyle bold23(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, 23),
      fontWeight: FontWeightHelper.bold,
      fontFamily: 'Playfair Display',
    );
  }

  static  TextStyle regular14_6(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, 14.6),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Poppins',
    );
  }
  static  TextStyle regular14(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, 14),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Poppins',
    );
  }

  static  TextStyle regular20(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,20),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Space Grotesk',
    );
  }

  static  TextStyle regular10(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,10),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Poppins',
    );
  }

  static  TextStyle regular16(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,16),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Space Grotesk',
    );
  }
  static  TextStyle regular15(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,15),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Poppins',
    );
  }
  static  TextStyle regular13(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,13),
      fontWeight: FontWeightHelper.normal,
      fontFamily: 'Poppins',
    );
  }
  static  TextStyle medium16(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,16),
      fontWeight: FontWeightHelper.medium,
      fontFamily: 'Space Grotesk',
    );
  }



  static  TextStyle bold16(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,16),
      fontWeight: FontWeightHelper.bold,
      fontFamily: 'Space Grotesk',
    );
  }
  static  TextStyle bold40(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,40),
      fontWeight: FontWeightHelper.bold,
      fontFamily: 'Playfair Display',
    );
  }

  static  TextStyle semiBold20(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,20),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: 'Poppins',
    );
  }
  static  TextStyle semiBold16(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,16),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: 'Poppins',
    );
  }
  static  TextStyle semiBold18(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,18),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: 'Poppins',
    );
  }

  static  TextStyle semiBold14(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,14),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: 'Poppins',
    );
  }

  static  TextStyle extraBold36(BuildContext context)
  {
    return TextStyle(
      fontSize: getResponsiveFontSize(context,36),
      fontWeight: FontWeightHelper.extraBold,
      fontFamily: 'Manrope',
    );
  }



  static getResponsiveFontSize(BuildContext context,double currentFontSize)
  {
    double scaleFactor=getScaleFactor(context);
    double responsiveFontSize=scaleFactor*currentFontSize;
    double minFontSize=.8*currentFontSize;
    double maxFontSize=1.2*currentFontSize;
    return responsiveFontSize.clamp(minFontSize, maxFontSize);



  }

  static double getScaleFactor(BuildContext context)
  {
    double width=MediaQuery.sizeOf(context).width;
    if(width<SizeConfig.tabletSize)
      {
        return width/400;
      }
    else if(width<SizeConfig.desktopSize)
      {
        return width/700;
      }
    else
      {
        return width/1000;
      }


  }



}