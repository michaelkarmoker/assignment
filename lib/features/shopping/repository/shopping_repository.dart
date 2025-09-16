import 'dart:io';

import 'package:dio/dio.dart';
import '../../../api/datasource/remote/dio/dio_client.dart';
import '../../../api/datasource/remote/exception/api_error_handler.dart';
import '../../../api/model/api_response.dart';
import '../../../utils/appconstant.dart';
import '../model/AddressRequest.dart';



class ShoppingRepository {
  final DioClient dioClient;


  ShoppingRepository({required this.dioClient});



  Future<ApiResponse> createAddress( AddressRequest addressRequest ) async {
    try {


      print(addressRequest);

      Response response = await dioClient.post(

        AppConstants.addAddress ,
        data: addressRequest.toJson()

      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "createAddress",  ),
      );
    }
  }


  ///========Get Address List==============
  Future<ApiResponse> getAddressList( String memberId) async {
    try {
      Response response = await dioClient.get(
       AppConstants.getMemberAddress+"/$memberId",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getAddressList",  ),
      );
    }
  }

///========delete address==============
  Future<ApiResponse> deleteAddress(String memberShippingAddressId,String memberId) async {
    try {
      Response response = await dioClient.delete(
        AppConstants.deleteAddress+"/$memberShippingAddressId/$memberId",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deleteAddress",  ),
      );
    }
  }


  ///========edit address==============
  Future<ApiResponse> updateAddress(AddressRequest addressRequest) async {
    try {
      Response response = await dioClient.put(
        AppConstants.editAddress+"/$addressRequest.memberShippingAddressId",
        data: addressRequest.toJson()
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "editAddress",  ),
      );
    }
  }





  ///========Get Country List==============
  Future<ApiResponse> getCountries( ) async {
    try {
      Response response = await dioClient.get(
        AppConstants.getAllCountries,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getCountries",  ),
      );
    }
  }

  ///========Get City List==============
  Future<ApiResponse> getCities(  ) async {
    try {
      Response response = await dioClient.get(
        AppConstants.getAllCities ,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getCities",  ),
      );
    }
  }


  ///========Get City List By Country ID==============
  Future<ApiResponse> getCitiesByCountryId(String countryId ) async {
    try {
      Response response = await dioClient.get(
        AppConstants.getCitiesByCountry+"/$countryId",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getCities",  ),
      );
    }
  }






}
