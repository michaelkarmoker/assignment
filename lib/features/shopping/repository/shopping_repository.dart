import 'dart:io';

import 'package:dio/dio.dart';
import '../../../api/datasource/remote/dio/dio_client.dart';
import '../../../api/datasource/remote/exception/api_error_handler.dart';
import '../../../api/model/api_response.dart';
import '../../../utils/appconstant.dart';



class ShoppingRepository {
  final DioClient dioClient;


  ShoppingRepository({required this.dioClient});

  Future<ApiResponse> getAddressList( ) async {
    try {


      Response response = await dioClient.get(
       AppConstants.getMemberAddress+"/1004",



      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getCategoryList",  ),
      );
    }
  }



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
