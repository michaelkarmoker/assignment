import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/app_colors.dart';

class StepItemWidget extends StatelessWidget {
    StepItemWidget({super.key,required this.isSelect,required this.title,required this.icon});
  bool isSelect;
  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              border: Border.all(color:isSelect?AppColors.primary:AppColors.gray,width: 1),
              color: isSelect?AppColors.primary:AppColors.white,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(icon,size: 20.w,color: isSelect?AppColors.white:AppColors.primary,)
        ),
        SizedBox(height: 10.h,),
        Text("${title}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isSelect?AppColors.black:AppColors.gray,
          fontWeight: isSelect?FontWeight.w500:FontWeight.w400,

        ),)
      ],
    );
  }
}
