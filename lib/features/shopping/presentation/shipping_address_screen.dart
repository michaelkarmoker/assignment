import 'package:assignment/core/enums/enums.dart';
import 'package:assignment/custom_widget/custom_button.dart';
import 'package:assignment/custom_widget/custom_textfield.dart';
import 'package:assignment/features/shopping/presentation/payment_screen.dart';
import 'package:assignment/features/shopping/presentation/widgets/address_edit_bottomSheet.dart';
import 'package:assignment/features/shopping/presentation/widgets/step_item_widget.dart';
import 'package:assignment/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_widget/custom_drop_down.dart';
import '../../../custom_widget/custom_loader.dart';
import '../../../dialogs/custom_dialog.dart';
import '../../../main.dart';
import '../logic/shopping_cubit.dart';
import '../model/Address.dart';

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
    if (mounted) {
      Get.context!.read<ShoppingCubit>().getAddressList();
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Stepper Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepItemWidget(isSelect: true,
                    icon: Icons.shopping_cart,
                    title: "Shopping Cart"),
                Container(height: 2, width: 40, color: AppColors.primary),
                StepItemWidget(isSelect: true,
                    icon: Icons.location_on,
                    title: "Shipping Address"),
                Container(height: 2, width: 40, color: AppColors.primary),
                StepItemWidget(
                    isSelect: false, icon: Icons.money, title: "Payment"),

              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildAddressList()),
            SizedBox(height: 10.h,),
            Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: CustomButton(
                      buttonType: ButtonType.secondary,
                      borderRadius: 6.r,
                      onTap: (){
                       Navigator.of(context).pop();
                      }, buttonText: "Back"),
                ),Expanded(
                  child: CustomButton(
                      borderRadius: 6.r,
                      onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentScreen()));

                      }, buttonText: "Continue"),
                )
              ],
            ),
            SizedBox(height: 10.h,),


          ],
        ),
      ),
    );
  }

  Widget _buildAddressList() {
    return BlocBuilder<ShoppingCubit, ShoppingState>(
      builder: (context, state) {
        if(state.loading){
          return Center(child: CustomLoader(size: 40.w,));
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:state.addressList?.length??0,
          itemBuilder: (context, index) {
            Address address=state.addressList![index];
            return GestureDetector(
              onTap: (){
                Get.context!.read<ShoppingCubit>().setAddresss(address);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: (state.selectedAddress?.memberShippingAddressId??0)==address.memberShippingAddressId?AppColors.primary:AppColors.gray.withOpacity(0.1),
                     width: 1.w
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  color: AppColors.primary.withOpacity(0.1)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${address.firstName} ${address.lastName}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize:16.sp
                          ),),
                          SizedBox(height: 5.h,),
                          Row(
                            spacing: 5.w,
                            children: [
                              Icon(Icons.phone,color: Colors.black,size: 20.w,),
                              Text("${address?.mobileNo??""}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          Row(
                            spacing: 5.w,
                            children: [
                              Icon(Icons.email,color: Colors.black,size: 20.w,),
                              Text("${address?.email??""}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          Row(
                            spacing: 5.w,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.home,color: Colors.black,size: 20.w,),
                              Expanded(
                                child: Text("${address?.addressLine1??""}, ${address?.addressLine2??""}, ${address?.city?.cityName??""}, ${address?.country?.countryName??""}",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                                ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                            child: Radio(
                                activeColor: AppColors.primary,
                                value: address.memberShippingAddressId, groupValue: state.selectedAddress?.memberShippingAddressId, onChanged: (v){
                              Get.context!.read<ShoppingCubit>().setAddresss(address);

                            }),
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            children: [



                              GestureDetector(
                                  onTap: (){
                                    CustomAlertDialog.show("Are you sure you want to delete this?",onPressed: (){

                                      Get.context!.read<ShoppingCubit>().deleteAddress(address.memberShippingAddressId.toString());
                                      Navigator.of(context).pop();

                                    },);
                                  },
                                  child: Icon(Icons.delete,size: 20.w,color: AppColors.primary,)),
                              SizedBox(width: 20.h,),
                              GestureDetector(
                                  onTap: (){
                                    Get.context!.read<ShoppingCubit>().editAddress(address);

                                  },
                                  child: Icon(Icons.edit,size: 20.w,color: AppColors.primary,)),
                            ],
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },);
      },
    );
  }
}
