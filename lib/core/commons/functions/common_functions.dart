


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

void navigate({required BuildContext context ,required String route, Object? arg,bool replacement=false})
{
  if(replacement==true)
  {
    Navigator.pushReplacementNamed(context,route,arguments: arg);
  }
  else
  {
    Navigator.pushNamed(context, route,arguments: arg);

  }
}
Future uploadImageToAPI(XFile image) async
{
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


void showToast({required String msg,required ToastStates toastStates}) async
{
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(toastStates),
      textColor: Colors.white,
      fontSize: 16.0
  );

}

Future<XFile?> imagePick({required ImageSource imageSource}) async
{
  XFile? image =await ImagePicker().pickImage(source: imageSource);
  return image!=null? image : null;

}

enum ToastStates{success,error,warning}

Color getColor(ToastStates toastStates)
{
  switch (toastStates)
  {
    case ToastStates.success:
      return AppColors.primaryColor;
    case ToastStates.error:
      return AppColors.primaryColor;
    case ToastStates.warning:
      return AppColors.primaryColor;
  }
}

buildScaffoldMessenger({required BuildContext context,required String msg,SnackBarBehavior? snackBarBehavior})
{

  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: AppTextStyles.regular16(context).copyWith(color: AppColors.white),
        ),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        behavior: snackBarBehavior?? SnackBarBehavior.fixed,
        duration: Duration(seconds: 5),
      ));

}

String formatDate(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  return '$day/$month/$year';
}
String formatClock(DateTime dateTime)
{
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  return '$hour:$minute';
}

getAmorPm(DateTime dateTime)
{
  int hour = dateTime.hour;
  if (hour > 12) {
    return 'PM';
  } else {
    return 'AM';
  }
}
void handleErrorinListenerFun(LoginFailureState state, BuildContext context) {
  if(state.errorModel.error!=null)
  {
    buildScaffoldMessenger(context: context, msg: state.errorModel.error!.toString().substring(1,state.errorModel.error!.toString().length-1));
  }
  else
  {
    buildScaffoldMessenger(context: context, msg: state.errorModel.errorMessage!);
  }
}

