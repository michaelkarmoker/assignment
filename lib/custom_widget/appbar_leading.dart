import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../main.dart';

class AppBarLeading extends StatelessWidget {
  final Function()? onLeadingTap;
  final bool isForcefullyShow;
  final Icon? icon;

  const AppBarLeading({
    super.key,
    this.onLeadingTap,
    required this.isForcefullyShow,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onLeadingTap ??
          () {
            if (FocusManager.instance.primaryFocus?.hasFocus == true) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
             Navigator.pop(context);
            //RouteService.pop();
          },
      child:
            isForcefullyShow || Navigator.canPop(Get.context!)
         // isForcefullyShow || RouteService.canPop()
              ? Padding(
                padding: EdgeInsets.fromLTRB(16.w, 7, 0, 7),
                child: Container(
                  width: 41.w,
                  height: 41.w,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 1,
                  //     color: Theme.of(context).hoverColor.withOpacity(0.2),
                  //   ),
                  //   borderRadius: BorderRadius.circular(10.r),
                  //   color: Colors.black12,
                  // ),
                  child: Center(
                    child:
                        icon ??
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18.sp,
                          color: Theme.of(context).iconTheme.color,
                        ),
                  ),
                ),
              )
              : SizedBox(width: 0.w),
    );
  }
}
