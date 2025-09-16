import 'package:assignment/core/enums/enums.dart';
import 'package:assignment/custom_widget/custom_button.dart';
import 'package:assignment/custom_widget/custom_snackbar.dart';
import 'package:assignment/custom_widget/custom_textfield.dart';
import 'package:assignment/features/shopping/model/CityListResponse.dart';
import 'package:assignment/features/shopping/model/CountryListResponse.dart';
import 'package:assignment/features/shopping/presentation/shipping_address_screen.dart';
import 'package:assignment/styles/app_colors.dart';
import 'package:assignment/utils/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_widget/custom_drop_down.dart';
import '../../../custom_widget/custom_phoneField.dart';
import '../../../main.dart';
import '../logic/shopping_cubit.dart';

class ShoppingScreen extends StatefulWidget {
   ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      Get.context!.read<ShoppingCubit>().setAddressType(AddressType.existing_address.toString());
      Get.context!.read<ShoppingCubit>().getCountryList();
      Get.context!.read<ShoppingCubit>().getCityList();


    }
  }

  FocusNode firstNameFcs=FocusNode();

  FocusNode lastNameFcs=FocusNode();

  FocusNode emailFcs=FocusNode();

  FocusNode phnFcs=FocusNode();

  FocusNode streetAddressFcs=FocusNode();

  FocusNode buildingNumberFcs=FocusNode();

  FocusNode cityFcs=FocusNode();

  FocusNode postCodeFcs=FocusNode();

   FocusNode countryFcs=FocusNode();

   FocusNode regionFcs=FocusNode();

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
    return BlocBuilder<ShoppingCubit, ShoppingState>(
  builder: (context, state) {
    return Form(
      key: Get.context!.read<ShoppingCubit>().shippingAddressFormKey,
      child: Column(
        children: [
          CustomTextField(
            textHeading: "First Name",
            hintText: "Enter your first name",
            controller: Get.context!.read<ShoppingCubit>().firstNameCtr,
            focusNode:firstNameFcs ,
            nextFocus: lastNameFcs,
            validator: Validators.requiredValidator.call,
          ),
          CustomTextField(
            textHeading: "Last Name",
            hintText: "Enter your last name",
            controller: Get.context!.read<ShoppingCubit>().lastNameCtr,
            focusNode:lastNameFcs ,
            nextFocus: emailFcs,
            validator: Validators.requiredValidator.call,
          ),
          CustomTextField(
            textHeading: "Email Address",
            hintText: "Enter your email address",
            controller: Get.context!.read<ShoppingCubit>().emailCtr,
            validator: Validators.emailValidator.call,
            focusNode:emailFcs ,
            nextFocus: phnFcs,
          ),
          CustomPhoneField(
            textHeading: "Phone Number",
            hintText: "Enter your phone number",
            controller: Get.context!.read<ShoppingCubit>().phoneNumberCtr,
            phonCodeController: Get.context!.read<ShoppingCubit>().phoneCodeCtr,
            focusNode:phnFcs ,
            initialCountryCode: 'AE',
            onChanged: (phone){

            },
            nextFocus: streetAddressFcs,
            validator: Validators.phoneValidator.call,
          ),


          // CustomTextField(
          //   textHeading: "Phone Number",
          //   hintText: "Enter your phone number",
          //   controller: Get.context!.read<ShoppingCubit>().phoneNumberCtr,
          //   focusNode:phnFcs ,
          //   nextFocus: streetAddressFcs,
          //   validator: Validators.phoneValidator.call,
          // ),
          CustomTextField(
            textHeading: "Street Address",
            hintText: "Write your street address",
            controller: Get.context!.read<ShoppingCubit>().streetAddressCtr,
            focusNode:streetAddressFcs ,
            nextFocus: buildingNumberFcs,
            validator: Validators.requiredValidator.call,
          ),
          CustomTextField(
            textHeading: "Building Name",
            hintText: "Write your building name",
            controller: Get.context!.read<ShoppingCubit>().buildingNumberCtr,
            focusNode:buildingNumberFcs ,

            nextFocus: null,
          ),

          Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Expanded(

                child: CustomDropdownField<City>(items: state.cityList??[],textHeading: "City",
                focusNode: cityFcs,

                required: true,
                  itemAsString:(City v){
                    return v.cityName ?? "";
                  },
                onChanged: (v){

                  Get.context!.read<ShoppingCubit>().setCity(v);
                },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  bottomPadding: 0,
                   verticalPadding: 11.w,
                  textHeading: "Post Code",
                  hintText: "Enter post code",
                  controller: Get.context!.read<ShoppingCubit>().postCodeCtr,
                  focusNode:postCodeFcs ,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomDropdownField<CountryData>(items: state.countryList??[],textHeading: "Country",
                  focusNode: countryFcs,
                  required: true,
                  itemAsString:(CountryData v){
                    return v.countryName ?? "";
                  },
                  onChanged: (v){
                   Get.context!.read<ShoppingCubit>().setCountry(v);

                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  bottomPadding: 0,
                  verticalPadding: 11.w,
                  textHeading: "Region/State",
                  hintText: "Enter Region/State",
                  controller: Get.context!.read<ShoppingCubit>().regionCtr,
                  focusNode:regionFcs ,
                  nextFocus: null,
                ),
              ),

            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                      child: Radio(
                        activeColor: Theme.of(context).primaryColor,

                          value: AddressType.existing_address.toString(), groupValue: state.selectedAddressType, onChanged: (value) {
                        Get.context!.read<ShoppingCubit>().setAddressType(value);
                      }),
                    ),
                    Expanded(
                      child: Text("Use An Existing Address",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                      ),),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.w,
                      child: Radio(

                          activeColor: Theme.of(context).primaryColor,
                          value: AddressType.new_address.toString(), groupValue: state.selectedAddressType, onChanged: (value) {
                        Get.context!.read<ShoppingCubit>().setAddressType(value);
                      }),
                    ),
                    Expanded(
                      child: Text("Use a New Address",style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                      )),
                    )
                  ],
                ),
              ),



            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomButton(
                    buttonType: ButtonType.secondary,
                    borderRadius: 6.r,
                    onTap: (){

                }, buttonText: "Back"),
              ),Expanded(
                child: CustomButton(
                  loading: state.loading,
                    borderRadius: 6.r,
                    onTap: (){
                      FocusScope.of(context).unfocus();
                      if(state.selectedAddressType==AddressType.new_address.toString()){
                        if(Get.context!.read<ShoppingCubit>().shippingAddressFormKey.currentState!.validate()){
                          Get.context!.read<ShoppingCubit>().createNewAddress();
                        }

                      }else if(state.selectedAddressType==AddressType.existing_address.toString()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShippingAddressScreen()));
                      }


                }, buttonText: "Continue"),
              )
            ],
          ),
          SizedBox(height: 10.h,),

          ]),
    );
  },
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
