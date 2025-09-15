import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../main.dart';
import '../custom_widget/custom_button.dart';
import '../styles/app_colors.dart';

GlobalKey _LocationServiceAlertKey = GlobalKey();

class CustomDialog {
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
          key: _LocationServiceAlertKey,
          // title: LocaleText('Opps!',
          //     style: GoogleFonts.roboto(
          //         fontWeight: FontWeight.w400,
          //         color: const Color(0xff000000),
          //         fontSize: 20.sp)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.h),
              // isSuccess
              //     ? SuccessContainer(width: 70.w, height: 70.w)
              //     : AppLogo(width: 70.w, height: 70.w),
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
                      buttonText: 'Okay',
                      onTap: () async {
                        if (onPressed != null) {
                          onPressed();
                        }
                        if (isAutoPop) {
                          Navigator.of(Get.context!).pop();
                        }
                      },
                      height: 30.h,
                      width: 75.w,
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