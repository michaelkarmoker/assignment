import 'dart:convert';

import 'package:assignment/features/shopping/model/CountryListResponse.dart';
import 'package:assignment/features/shopping/repository/shopping_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


import 'package:meta/meta.dart';

import '../../../api/model/api_response.dart';
import '../../../core/base/base_cubit.dart';
import '../../../custom_widget/custom_snackbar.dart';
import '../../../main.dart';
import '../../../utils/appconstant.dart';
import '../model/CityListResponse.dart';


part 'shopping_state.dart';

class ShoppingCubit extends BaseCubit<ShoppingState> {


  final ShoppingRepository shoppingRepository;
  ShoppingCubit({required this.shoppingRepository}) : super(ShoppingState());

  final shippingAddressFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameCtr = TextEditingController();
  final TextEditingController lastNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneNumberCtr = TextEditingController();
  final TextEditingController streetAddressCtr = TextEditingController();
  final TextEditingController buildingNumberCtr = TextEditingController();
  final TextEditingController postCodeCtr = TextEditingController();
  final TextEditingController regionCtr = TextEditingController();



setAddressType(String? addressType){
  emit(state.copyWith(selectedAddressType:addressType ));
}




  Future<void> getAddressList( ) async {

    emit(state.copyWith(loading: true));
    // var deviceToken = await NotificationService.getDeviceToken();
    ApiResponse apiResponse = await shoppingRepository.getAddressList(  );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
       try {


      // final List<dynamic> responseData =apiResponse.response?.data; // Your raw JSON list
      // final categories = responseData.map((e) => CategoryModel.fromJson(e)).toList();

      emit(state.copyWith(loading: false ));


       }catch(e){
         emit(state.copyWith(loading: false));
         showSnackBar(e.toString(),mustShowInReleaseMode: false);

       }



    } else {
      // dismissLoaderDialog();
      emit(state.copyWith(loading: false));


    }
  }


  Future<void> getCountryList( ) async {

    emit(state.copyWith(loading: true));
    // var deviceToken = await NotificationService.getDeviceToken();
    ApiResponse apiResponse = await shoppingRepository.getCountries(  );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
      try {

        CountryListResponse countryListResponse=CountryListResponse.fromJson(apiResponse.response?.data);

        // final List<dynamic> responseData =apiResponse.response?.data; // Your raw JSON list
        // final categories = responseData.map((e) => CategoryModel.fromJson(e)).toList();

        emit(state.copyWith(loading: false ,countryList: countryListResponse.data));


      }catch(e){
        emit(state.copyWith(loading: false));
        showSnackBar(e.toString(),mustShowInReleaseMode: false);

      }



    } else {
      // dismissLoaderDialog();
      emit(state.copyWith(loading: false));


    }
  }

  Future<void> getCityList( ) async {

    emit(state.copyWith(loading: true));
    // var deviceToken = await NotificationService.getDeviceToken();
    ApiResponse apiResponse = await shoppingRepository.getCities( );

    if ((apiResponse.response?.statusCode ??
        AppConstants.STATUS_CODE_UNDEFINED) ==
        200) {
      // try {
        final List<dynamic> decoded =  apiResponse.response?.data ;
        List<City> cities = decoded.map((e) => City.fromJson(e)).toList();


         emit(state.copyWith(loading: false ,cityList: cities));


      // }catch(e){
      //   emit(state.copyWith(loading: false));
      //   showSnackBar(e.toString(),mustShowInReleaseMode: false);
      //
      // }



    } else {
      // dismissLoaderDialog();
      emit(state.copyWith(loading: false));


    }
  }
    void clearControllers() {

    }


  @override
  void clear() {
    emit(ShoppingState());
  }

}


