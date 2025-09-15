
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../main.dart';
import 'images.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
double scale() {
  final screenWidth = MediaQuery.of(Get.context!).size.width;
  return screenWidth < 360 ? 0.85 : screenWidth < 480 ? 1.0 : screenWidth < 720 ? 1.1 : 1.2;
}

class AppConstants {
  static const String appName = "Assignment";
  static const String appVersion = '1.0';

  /// API URL's

   static const String baseUrl = 'https://iconiccollectors.r-y-x.net/api/';

//address url
  static String getMemberAddress = 'membershipAddress/GetByMember';
  static String getMemberDefaultAddress = 'membershipAddress/GetByMemberDefault';
  static String addAddress = 'membershipAddress/Add';
  static String editAddress = 'membershipAddress/Edit';
  static String deleteAddress = 'membershipAddress/delete';

//country and city

  static String getAllCountries = 'countries/all';
  static String getAllCities = 'cities/GetAll';
  static String getCitiesByCountry = 'cities/GetAllByCountry';
  static String getCitiesById = 'cities/GetAllByCountry';













  //session
  static const String SELECTED_GENRES = 'selected_genres';
  static const String SELECTED_MOODES = 'selected_moodes';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String accept = 'Accept';
  static const String authorization = 'Authorization';
  static const String token = 'token';
  static const String contentType = 'Content-Type';
  static const String xAuthToken = 'x_auth_token';
  static const String theme = 'theme';
  static const String SESSION = "session";






  static const int STATUS_CODE_UNDEFINED = -1;









}