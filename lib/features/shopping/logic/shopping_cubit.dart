import 'dart:convert';

import 'package:assignment/features/shopping/model/Address.dart';
import 'package:assignment/features/shopping/model/CountryListResponse.dart';
import 'package:assignment/features/shopping/presentation/shipping_address_list_screen.dart';
import 'package:assignment/features/shopping/repository/shopping_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:canopas_country_picker/canopas_country_picker.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';


import 'package:meta/meta.dart';

import '../../../api/model/api_response.dart';
import '../../../core/base/base_cubit.dart';
import '../../../custom_widget/custom_snackbar.dart';
import '../../../main.dart';
import '../../../utils/appconstant.dart';
import '../model/AddressRequest.dart';
import '../model/CityListResponse.dart';

import '../presentation/widgets/address_edit_bottomSheet.dart';


part 'shopping_state.dart';

class ShoppingCubit extends BaseCubit<ShoppingState> {


  final ShoppingRepository shoppingRepository;
  ShoppingCubit({required this.shoppingRepository}) : super(ShoppingState());

  String memberId="1004";


  final shippingAddressFormKey = GlobalKey<FormState>();
  final shippingAddressEditFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameCtr = TextEditingController();
  final TextEditingController lastNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneNumberCtr = TextEditingController();
  final TextEditingController phoneCodeCtr = TextEditingController();
  final TextEditingController streetAddressCtr = TextEditingController();
  final TextEditingController buildingNumberCtr = TextEditingController();
  final TextEditingController postCodeCtr = TextEditingController();
  final TextEditingController regionCtr = TextEditingController();

  ///Focus Node================
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



setAddressType(String? addressType){
  emit(state.copyWith(selectedAddressType:addressType ));
}

  setCity(City? city){
    emit(state.copyWith(selectedCity:city ));
  }
  setCountry(CountryData? country){
    emit(state.copyWith(selectedCountry:country ));
  }

  setAddresss(Address? address){
    emit(state.copyWith(selectedAddress:address ));
  }
  ///=========Create Address============
  Future<void> createNewAddress( ) async {

    emit(state.copyWith(loading: true));


    AddressRequest addressRequest=AddressRequest(
      memberShippingAddressId: 0,
      memberId:memberId ,
      firstName: firstNameCtr.text,
      lastName: lastNameCtr.text,
      email: emailCtr.text,
      phoneCode: phoneCodeCtr.text,
      mobileNo: phoneNumberCtr.text,
      addressLine1: streetAddressCtr.text,
      addressLine2: buildingNumberCtr.text,
      cityId: state.selectedCity?.cityId??0,
      countryId: state.selectedCountry?.countryId??0,
      zipCode: postCodeCtr.text,
      isDefault: true,
    );

    ApiResponse apiResponse = await shoppingRepository.createAddress(addressRequest );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
       try {
         String message=apiResponse?.response?.data["message"];
         showSnackBar(message,isError: false);
         emit(state.copyWith(loading: false ));
         Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=>ShippingAddressListScreen()));
      }catch(e){
        emit(state.copyWith(loading: false));
        showSnackBar(e.toString(),mustShowInReleaseMode: false);
      }
    } else {
      emit(state.copyWith(loading: false));


    }
  }

  ///=========Get All Address============
  Future<void> getAddressList( ) async {
    emit(state.copyWith(loading: true));
    ApiResponse apiResponse = await shoppingRepository.getAddressList( memberId );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
       try {
         final List<dynamic> decoded =  apiResponse.response?.data ;
         List<Address> addressList = decoded.map((e) => Address.fromJson(e)).toList();

         addressList.map((e){
           if((e?.isDefault??false)){
             emit(state.copyWith(selectedAddress: e));
           }
         }).toList();
         emit(state.copyWith(loading: false,addressList: addressList ));
       }catch(e){
         emit(state.copyWith(loading: false));
         showSnackBar(e.toString(),mustShowInReleaseMode: false);

       }



    } else {
      // dismissLoaderDialog();
      emit(state.copyWith(loading: false));


    }
  }



  ///=========Create Address============
  Future<void> updateAddress(Address address ) async {

    emit(state.copyWith(loading: true));


    AddressRequest addressRequest=AddressRequest(
      memberShippingAddressId: address?.memberShippingAddressId??0,
      memberId:memberId ,
      firstName: firstNameCtr.text,
      lastName: lastNameCtr.text,
      email: emailCtr.text,
      phoneCode: phoneCodeCtr.text,
      mobileNo: phoneNumberCtr.text,
      addressLine1: streetAddressCtr.text,
      addressLine2: buildingNumberCtr.text,
      cityId: state.selectedCity?.cityId??0,
      countryId: state.selectedCountry?.countryId??0,
      zipCode: postCodeCtr.text,
      isDefault: true,
    );

    ApiResponse apiResponse = await shoppingRepository.updateAddress(addressRequest );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
      try {

        Navigator.pop(Get.context!);
        String message=apiResponse?.response?.data["message"];
        showSnackBar(message,isError: false);
        await getAddressList();
        emit(state.copyWith(loading: false ));
      }catch(e){
        emit(state.copyWith(loading: false));
        showSnackBar(e.toString(),mustShowInReleaseMode: false);
      }
    } else {
      emit(state.copyWith(loading: false));


    }
  }


  ///=========Delete Address============
  Future<void> deleteAddress(String memberShippingAddressId ) async {

    emit(state.copyWith(loading: true));
    // var deviceToken = await NotificationService.getDeviceToken();
    ApiResponse apiResponse = await shoppingRepository.deleteAddress( memberShippingAddressId ,memberId);

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
      try {

        String message=apiResponse?.response?.data["message"];
        showSnackBar(message,isError: false);
        await getAddressList();
        emit(state.copyWith(loading: false ));

      }catch(e){
        emit(state.copyWith(loading: false));
        showSnackBar(e.toString(),mustShowInReleaseMode: false);
      }
    } else {
      emit(state.copyWith(loading: false));
    }
  }







  ///=========Get All Country============
  Future<void> getCountryList( ) async {

    emit(state.copyWith(loading: true));
    ApiResponse apiResponse = await shoppingRepository.getCountries(  );
    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
      try {
        CountryListResponse countryListResponse=CountryListResponse.fromJson(apiResponse.response?.data);
        emit(state.copyWith(loading: false ,countryList: countryListResponse.data));
      }catch(e){
        emit(state.copyWith(loading: false));
        showSnackBar(e.toString(),mustShowInReleaseMode: false);
      }
    } else {
      emit(state.copyWith(loading: false));
    }
  }


  ///=========Get All City============
  Future<void> getCityList( ) async {

    emit(state.copyWith(loading: true));
    // var deviceToken = await NotificationService.getDeviceToken();
    ApiResponse apiResponse = await shoppingRepository.getCities( );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
       try {
        final List<dynamic> decoded =  apiResponse.response?.data ;
        List<City> cities = decoded.map((e) => City.fromJson(e)).toList();


         emit(state.copyWith(loading: false ,cityList: cities));


      }catch(e){
        emit(state.copyWith(loading: false));
        showSnackBar(e.toString(),mustShowInReleaseMode: false);

      }



    } else {
      // dismissLoaderDialog();
      emit(state.copyWith(loading: false));


    }
  }



  void clearControllers() {
    firstNameCtr.clear();
    lastNameCtr.clear();
    emailCtr.clear();
    phoneNumberCtr.clear();
    phoneCodeCtr.clear();
    streetAddressCtr.clear();
    buildingNumberCtr.clear();
    postCodeCtr.clear();
    setCity(City());
    setCountry(CountryData());
    }


  @override
  void clear() {
    clearControllers();
    emit(ShoppingState());
  }

  void insertAddress(Address address) {


     // Example Alpha-2 code for the United States

    firstNameCtr.text=address.firstName??"";
    lastNameCtr.text=address.lastName??"";
    emailCtr.text=address.email??"";
    phoneNumberCtr.text=address.mobileNo??"";
    phoneCodeCtr.text=address.phoneCode??"";
    streetAddressCtr.text=address.addressLine1??"";
    buildingNumberCtr.text=address.addressLine2??"";
    postCodeCtr.text=address.zipCode??"";
    City selectedCity=City(cityId: address.cityId,cityName: address.city?.cityName,arabicCityName: address.city?.arabicCityName );
    CountryData selectedCountry=CountryData(countryId: address.countryId,countryKey: address.country?.countryKey,countryName: address.country?.countryName,);

    emit(state.copyWith(selectedCity:selectedCity ,selectedCountry: selectedCountry));

    AddressEditDialog.showEditBottomSheet(context: Get.context!,address: address).then((onvalue){
      clearControllers();
    });


  }





}


