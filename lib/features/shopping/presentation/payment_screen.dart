import 'package:assignment/features/shopping/presentation/widgets/step_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
          child: Column(
            children: [
              const SizedBox(height: 20),
              StepItemWidget(step: 3,),
               
              const SizedBox(height: 20),
              Center(
                child: Text('Payment Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
