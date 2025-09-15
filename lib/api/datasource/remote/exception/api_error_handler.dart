import 'dart:developer';

import 'package:dio/dio.dart';


import '../../../../custom_widget/custom_snackbar.dart';
import '../../../model/error_response.dart';


var isSignOutCalled = true;

class ApiErrorHandler {
  static dynamic handle(
    error,
    from, {
    bool mustShowErrorInReleaseMode = false,
  }) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription =
                  "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  if (error.response?.data is String) {
                    errorDescription = "${error.response?.data}";
                  } else if (error.response?.data['errors'] != null) {
                    ErrorResponse errorResponse = ErrorResponse.fromJson(
                      error.response?.data,
                    );
                    // errorDescription = errorResponse.errors?[0].message;
                    errorDescription = errorResponse.message ?? "";
                  } else {
                    errorDescription =
                        error.response?.data['message'] ?? "${error.message}";
                  }
                  break;
                case 403:
                  if (error.response?.data is String) {
                    errorDescription = "${error.response?.data}";
                  } else if (error.response?.data['errors'] != null) {
                    ErrorResponse errorResponse = ErrorResponse.fromJson(
                      error.response?.data,
                    );
                    // errorDescription = errorResponse.errors?[0].message;
                    errorDescription = errorResponse.message ?? "";
                  } else {
                    errorDescription = error.response!.data['message'];
                  }
                  break;
                case 401:

                  // if(error.response!.data['errors'] != null){
                  //   ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                  //   // errorDescription = errorResponse.errors?[0].message;
                  //   errorDescription = errorResponse.message ?? "";
                  // }else{
                  //   errorDescription = error.response!.data['message'];
                  // }
                  // log(
                  //   "token ${Session.getToken()} isSignOutCalled ${isSignOutCalled}",
                  // );
                  errorDescription =
                      "Invalid credential or unauthorized user found";

                  break;
                case 404:
                  if (error.response?.data is String) {
                    errorDescription = "${error.response?.data}";
                  } else if (error.response?.data['errors'] != null) {
                    ErrorResponse errorResponse = ErrorResponse.fromJson(
                      error.response?.data,
                    );
                    // errorDescription = errorResponse.errors?[0].message;
                    errorDescription = errorResponse.message ?? "";
                  } else {
                    errorDescription =
                        error.response?.data['message'] ?? "Not found";
                  }
                  break;
                case 409:
                  errorDescription = "User Name or Email already exists";
                  break;
                case 413:
                  errorDescription = error.response?.statusMessage ?? "";
                  break;
                case 500:
                  if (error.response?.data is String) {
                    errorDescription = "${error.response?.data}";
                  } else if (error.response?.data != null) {
                    ErrorResponse errorResponse = ErrorResponse.fromJson(
                      error.response?.data,
                    );
                    errorDescription = errorResponse.message ?? "";
                  } else {
                    errorDescription = "Internal server error";
                  }

                  break;
                case 503:
                  errorDescription = error.response?.statusMessage ?? "";
                  break;
                case 429:
                  errorDescription = error.response?.statusMessage ?? "";
                  break;
                default:
                  if (error.response?.data is String) {
                    errorDescription = "${error.response?.data}";
                  } else {
                    ErrorResponse errorResponse = ErrorResponse.fromJson(
                      error.response!.data,
                    );
                    if (errorResponse.errors != null &&
                        errorResponse.errors!.isNotEmpty) {
                      errorDescription = errorResponse.toString();
                    } else {
                      errorDescription =
                          "Failed to load data - status code: ${error.response!.statusCode}";
                    }
                  }
              }
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "Bad certificate";
              break;
            case DioExceptionType.connectionError:
              errorDescription = "Connection error, can't connect with server";
              break;
            case DioExceptionType.unknown:
              errorDescription = "Request to API call limit excited ";
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred $error";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "Unknown exception";
    }
    showSnackBar(
      "$errorDescription",
      isError: true,
      mustShowInReleaseMode: mustShowErrorInReleaseMode,
    );
    return errorDescription;
  }
}
