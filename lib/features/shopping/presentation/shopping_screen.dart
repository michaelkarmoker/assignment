import 'package:assignment/custom_widget/custom_textfield.dart';
import 'package:assignment/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../logic/shopping_cubit.dart';

class ShoppingScreen extends StatelessWidget {
   ShoppingScreen({super.key});


  FocusNode firstNameFcs=FocusNode();
  FocusNode lastNameFcs=FocusNode();
  FocusNode emailFcs=FocusNode();
  FocusNode phnFcs=FocusNode();
  FocusNode streetAddressFcs=FocusNode();
  FocusNode buildingNumberFcs=FocusNode();
  FocusNode postCodeFcs=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
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
                _buildStep(isSelect: true, icon: Icons.shopping_cart, title:  "Shopping Cart"),
                Container(height: 2, width: 40, color: AppColors.primary),
                _buildStep(isSelect: true, icon: Icons.location_on, title:  "Shipping Address"),
                Container(height: 2, width: 40, color: AppColors.primary),
                _buildStep(isSelect: false, icon: Icons.money, title:  "Payment"),

              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildForm(),
                  ],
                ),
              ),
            )
        
          ],
        ),
      ),
    );
  }


  Widget _buildForm(){
    return Column(
      children: [
        CustomTextField(
          textHeading: "First Name",
          hintText: "Enter your first name",
          controller: Get.context!.read<ShoppingCubit>().firstNameCtr,
          focusNode:firstNameFcs ,
          nextFocus: lastNameFcs,
        ),
        CustomTextField(
          textHeading: "Last Name",
          hintText: "Enter your last name",
          controller: Get.context!.read<ShoppingCubit>().lastNameCtr,
          focusNode:lastNameFcs ,
          nextFocus: lastNameFcs,
        ),
        CustomTextField(
          textHeading: "Email Address",
          hintText: "Enter your email address",
          controller: Get.context!.read<ShoppingCubit>().emailCtr,
          focusNode:emailFcs ,
          nextFocus: phnFcs,
        ),
        CustomTextField(
          textHeading: "Phone Number",
          hintText: "Enter your phone number",
          controller: Get.context!.read<ShoppingCubit>().phoneNumberCtr,
          focusNode:phnFcs ,
          nextFocus: streetAddressFcs,
        ),
        CustomTextField(
          textHeading: "Street Address",
          hintText: "Write your street address",
          controller: Get.context!.read<ShoppingCubit>().streetAddressCtr,
          focusNode:streetAddressFcs ,
          nextFocus: buildingNumberFcs,
        ),
        CustomTextField(
          textHeading: "Building Name",
          hintText: "Write your building name",
          controller: Get.context!.read<ShoppingCubit>().buildingNumberCtr,
          focusNode:buildingNumberFcs ,
          nextFocus: null,
        )
        ]);
  }







  Widget _buildStep({required bool isSelect,required IconData icon,required String title}){
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
        Text("${title}",style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
          color: isSelect?AppColors.black:AppColors.gray,
          fontWeight: isSelect?FontWeight.w500:FontWeight.w400,

        ),)
      ],
    );
  }


}
