// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../main.dart';
import '../styles/app_colors.dart';

void showSnackBar(
    String? message,
    {bool isError = true,
    bool mustShowInReleaseMode = true,
    int seconds = 3,
    String? buttonLabel,
    final VoidCallback? onPressed}) async {

  if (Get.context == null) {
    return;
  }
  /// LOL :D
  if("$message" == "null"){
    return;
  }

  if (!Get.context!.mounted) {
    return;
  }

  var snackBar = SnackBar(
    dismissDirection: DismissDirection.horizontal,
    margin: EdgeInsets.all(16.w),
    duration: Duration(seconds: seconds),
    backgroundColor: isError ? AppColors.red : AppColors.green,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    content: Text(message ?? "-", style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(color: Colors.white)),
    action: (buttonLabel?.isEmpty ?? true)
        ? null
        : SnackBarAction(label: buttonLabel ?? "Okay", onPressed: onPressed!,textColor: AppColors.white,backgroundColor: AppColors.yellow,),

  );

  if(isError){
    // Sentry.captureException(
    //   isError,
    //   stackTrace: StackTrace.current,
    // );

    if(kReleaseMode){
      // release mode
      if(mustShowInReleaseMode){
        // show success and error both types of snack bar in dev mode
        _show(snackBar);
      }else{
        // FirebaseCrashlytics.instance.recordError(Exception(message), StackTrace.current,
        //     reason: 'Critical',
        //     fatal: true);
      }
    }else{
      // dev mode
      StackTrace currentStack = StackTrace.current;
      debugPrint("showSnackBar called from: ${currentStack.toString()}\n\n${message}");

      // show success and error both types of snack bar in dev mode
      _show(snackBar);
    }
  }else {
    // show success snack bar
    _show(snackBar);
  }
}

void _show(SnackBar snackBar){
  ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}
