import 'package:assignment/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../main.dart';
import '../custom_widget/custom_button.dart';
import '../styles/app_colors.dart';

GlobalKey _LocationServiceAlertKey = GlobalKey();

class CustomAlertDialog {
  static Future<void> show(
      String msg, {
        VoidCallback? onPressed,
        bool isAutoPop = true,
        bool isSuccess = false,
      }) async {
    if (_LocationServiceAlertKey.currentContext != null) {
      Navigator.of(Get.context!).pop();
      _LocationServiceAlertKey.currentState?.dispose();
      _LocationServiceAlertKey = GlobalKey();
    }

    await showDialog(
      barrierDismissible: false,
      context: Get.context!,

      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          key: _LocationServiceAlertKey,

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.all(6.w),
                child: Text(
                  msg,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonType: ButtonType.secondary,
                      buttonText: 'Cancel',
                      onTap: () async {
                        if (onPressed != null) {
                          Navigator.of(Get.context!).pop();
                        }
                      },
                      height: 30.h,
                      borderRadius: 6.r,
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  Expanded(
                    child: CustomButton(
                      buttonText: 'Confirm',
                      onTap: () async {
                        if (onPressed != null) {
                          onPressed();
                        }

                      },
                      height: 30.h,
                      borderRadius: 6.r,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}