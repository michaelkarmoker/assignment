import 'package:assignment/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../../main.dart';
import '../../../../custom_widget/custom_button.dart';
import '../../../../custom_widget/custom_drop_down.dart';
import '../../../../custom_widget/custom_phoneField.dart';
import '../../../../custom_widget/custom_textfield.dart';
import '../../../../styles/app_colors.dart';
import '../../../../utils/validator.dart';
import '../../logic/shopping_cubit.dart';
import '../../model/CityListResponse.dart';
import '../../model/CountryListResponse.dart';



class AddressEditDialog {


  
  
  static Future<void> showEditBottomSheet(
      {required BuildContext context}
      ) async {

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.4, // minimum height (40% of screen)
          maxChildSize: 0.9, // maximum height (90% of screen)
          initialChildSize: 0.7,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 5.h,),
                  Center(child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                    ),
                    width: 50.w,height: 10,),),
                  SizedBox(height: 20,),
                  Expanded(
                    child: BlocBuilder<ShoppingCubit, ShoppingState>(
                      builder: (context, state) {
                        return Form(
                          key: Get.context!.read<ShoppingCubit>().shippingAddressEditFormKey,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                                children: [
                                  CustomTextField(
                                    textHeading: "First Name",
                                    hintText: "Enter your first name",
                                    controller: Get.context!.read<ShoppingCubit>().firstNameCtr,
                                    focusNode:Get.context!.read<ShoppingCubit>().firstNameFcs ,
                                    nextFocus: Get.context!.read<ShoppingCubit>().lastNameFcs,
                                    validator: Validators.requiredValidator.call,
                                  ),
                                  CustomTextField(
                                    textHeading: "Last Name",
                                    hintText: "Enter your last name",
                                    controller: Get.context!.read<ShoppingCubit>().lastNameCtr,
                                    focusNode:Get.context!.read<ShoppingCubit>().lastNameFcs ,
                                    nextFocus: Get.context!.read<ShoppingCubit>().emailFcs,
                                    validator: Validators.requiredValidator.call,
                                  ),
                                  CustomTextField(
                                    textHeading: "Email Address",
                                    hintText: "Enter your email address",
                                    controller: Get.context!.read<ShoppingCubit>().emailCtr,
                                    validator: Validators.emailValidator.call,
                                    focusNode:Get.context!.read<ShoppingCubit>().emailFcs ,
                                    nextFocus: Get.context!.read<ShoppingCubit>().phnFcs,
                                  ),
                                  CustomPhoneField(
                                    textHeading: "Phone Number",
                                    hintText: "Enter your phone number",
                                    controller: Get.context!.read<ShoppingCubit>().phoneNumberCtr,
                                    phonCodeController: Get.context!.read<ShoppingCubit>().phoneCodeCtr,
                                    focusNode:Get.context!.read<ShoppingCubit>().phnFcs ,
                                    initialCountryCode: 'AE',
                                    onChanged: (phone){

                                    },
                                    nextFocus: Get.context!.read<ShoppingCubit>().streetAddressFcs,
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
                                    focusNode:Get.context!.read<ShoppingCubit>().streetAddressFcs ,
                                    nextFocus: Get.context!.read<ShoppingCubit>().buildingNumberFcs,
                                    validator: Validators.requiredValidator.call,
                                  ),
                                  CustomTextField(
                                    textHeading: "Building Name",
                                    hintText: "Write your building name",
                                    controller: Get.context!.read<ShoppingCubit>().buildingNumberCtr,
                                    focusNode:Get.context!.read<ShoppingCubit>().buildingNumberFcs ,

                                    nextFocus: null,
                                  ),

                                  Row(
                                    spacing: 10.w,
                                    mainAxisAlignment: MainAxisAlignment.end,

                                    children: [
                                      Expanded(

                                        child: CustomDropdownField<City>(items: state.cityList??[],textHeading: "City",
                                          focusNode: Get.context!.read<ShoppingCubit>().cityFcs,

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
                                          focusNode:Get.context!.read<ShoppingCubit>().postCodeFcs ,
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
                                          focusNode: Get.context!.read<ShoppingCubit>().countryFcs,
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
                                          focusNode:Get.context!.read<ShoppingCubit>().regionFcs ,
                                          nextFocus: null,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 13.h,),

                                  CustomButton(
                                    width: double.infinity,
                                      loading: state.loading,
                                      borderRadius: 6.r,
                                      onTap: (){
                                        FocusScope.of(context).unfocus();

                                        if(Get.context!.read<ShoppingCubit>().shippingAddressEditFormKey.currentState!.validate()){
                                          Get.context!.read<ShoppingCubit>().updateAddress();
                                        }

                                      }, buttonText: "Update"),

                                  SizedBox(height: 20,),


                                ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },

        );
      },
    );
  }
}