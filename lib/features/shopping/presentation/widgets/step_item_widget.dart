import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/app_colors.dart';

class StepItemWidget extends StatelessWidget {
    StepItemWidget({super.key,required this.step, });
  int step;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color:step>0?AppColors.primary:AppColors.gray,width: 1),
                color: step>0?AppColors.primary:AppColors.white,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(Icons.shopping_cart,size: 20.w,color: step>0?AppColors.white:AppColors.primary,)
          ),
          Expanded(child: Container(height: 2, width: 50.w,  color: step>1?AppColors.primary:AppColors.gray)),
          Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color:step>1?AppColors.primary:AppColors.gray,width: 1),
                color: step>1?AppColors.primary:AppColors.white,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(Icons.location_on,size: 20.w,color: step>1?AppColors.white:AppColors.primary,)
          ),
          Expanded(child: Container(height: 2, width: 50.w,  color: step>2?AppColors.primary:AppColors.gray)),
          Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color:step>2?AppColors.primary:AppColors.gray,width: 1),
                color: step>2?AppColors.primary:AppColors.white,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Icon(Icons.money,size: 20.w,color: step>2?AppColors.white:AppColors.primary,)
          ),

        ],),

        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text("Shopping Cart",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: step>0?AppColors.black:AppColors.gray,
                fontWeight: step>0?FontWeight.w500:FontWeight.w400,

              ),),
            ),
            Expanded(
              child: Text("Shipping Address",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: step>1?AppColors.black:AppColors.gray,

                fontWeight: step>1?FontWeight.w500:FontWeight.w400,

              ),),
            ),
            Expanded(
              child: Text("Payment",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: step>2?AppColors.black:AppColors.gray,
                fontWeight: step>2?FontWeight.w500:FontWeight.w400,

              ),),
            ),
          ],
        )
      ],
    );
  }
}
