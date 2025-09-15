import 'dart:io';

import 'package:dio/dio.dart';
import '../../../api/datasource/remote/dio/dio_client.dart';
import '../../../api/datasource/remote/exception/api_error_handler.dart';
import '../../../api/model/api_response.dart';
import '../../../utils/appconstant.dart';



class ShoppingRepository {
  final DioClient dioClient;


  ShoppingRepository({required this.dioClient});

  Future<ApiResponse> getCategoryList( int page) async {
    try {


      Response response = await dioClient.get(
        AppConstants.categoryList+"?page=$page",



      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getCategoryList",  ),
      );
    }
  }









}
