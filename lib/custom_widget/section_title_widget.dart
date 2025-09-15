import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(8),
      child: Text(title, style:  TextStyle(fontWeight: FontWeight.w500,fontSize:16.sp )),
    );
  }
}
