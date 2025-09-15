import 'package:assignment/core/enums/enums.dart';
import 'package:assignment/custom_widget/custom_button.dart';
import 'package:assignment/custom_widget/custom_textfield.dart';
import 'package:assignment/features/shopping/presentation/widgets/step_item_widget.dart';
import 'package:assignment/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_widget/custom_drop_down.dart';
import '../../../main.dart';
import '../logic/shopping_cubit.dart';

class ShippingAddressScreen extends StatefulWidget {
  ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
    Get.context!.read<ShoppingCubit>().getCountryList();
    Get.context!.read<ShoppingCubit>().getCityList();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Address List'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.w),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Stepper Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepItemWidget(isSelect: true, icon: Icons.shopping_cart, title:  "Shopping Cart"),
                Container(height: 2, width: 40, color: AppColors.primary),
                StepItemWidget(isSelect: true, icon: Icons.location_on, title:  "Shipping Address"),
                Container(height: 2, width: 40, color: AppColors.primary),
                StepItemWidget(isSelect: false, icon: Icons.money, title:  "Payment"),

              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildAddressList()),


          ],
        ),
      ),
    );
  }

  Widget _buildAddressList(){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context,index){
      return Container();
    },);
  }
}
