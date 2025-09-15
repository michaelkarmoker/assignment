
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
  static const String appName = "MCC ORG";
  static const String appVersion = '1.0';

  /// API URL's
  //static const String baseUrl = 'https://music-app-1-d9nj.onrender.com/api/v1';
  //static const String baseUrl = 'https://dev.mcofcanada.com/widget.php?apiFName=';
  //static const String baseFile = 'https://dev.mcofcanada.com';
   static const String baseUrl = 'https://mcofcanada.com/widget.php?apiFName=';
   static const String baseFile = 'https://mcofcanada.com';
  static const String versionUrl = '$baseUrl/api/v0';
  static String bLoginURI = 'ajLoginMoreInfo';
  static String profileURI = 'getManpowerProfile';
  static String reportURI = 'getPersonalReport';
  static String saveReportURI = 'savePersonalReport';
  static String profileUpdateURI = 'updateManpowerProfile';
  static String userUpdateURI = 'updateManpower';
  static String loginURI = 'login';
  static String doclistURI = 'getAllDocuments';
  static String eventListURI = 'getAllEventManagements';
  static String contactUsSubmit = 'sendContactUsMessage';
  static String registerURI= 'demo';

  ///zones,chapters,subchapters,value
  static String zoneListURI = 'getAllZones';
  static String chapterListURI = 'getAllChapters';
  static String subchapterListURI = 'getAllSubChapters';
  static String venueListURI = 'getAllVenues';

  ///category================
  static String categoryList = '$versionUrl/product-cat/getAll';
  static String createCategory = '$versionUrl/product-cat/create';

/// product==========
  static String productList = '$versionUrl/product/getAll';
  static String productDelete = '$versionUrl/product/delete';
  static String productCreate = '$versionUrl/product/create';
  static String productUpdate = '$versionUrl/product/update';
  static String productDetails = '$versionUrl/product/getById';


  //static String userFollowingsPost = '$baseUrl/follows/followings';
  static String addressURI = '$baseUrl/address';
  static String updateAddressURI = '$baseUrl/address';
  static String songURI = '$baseUrl/songs';
  static String allSongURI = '$baseUrl/songs/all';
  static String albumURI = '$baseUrl/albums';
  static String sizeListURI = '$baseUrl/sizes';

  //merchandise==========
  static String productUri = '$baseUrl/merchandises';

  //cart====================
  static String cartUri = '$baseUrl/purchases/cart';
  static String checkoutUri = '$baseUrl/purchases/checkout';
  static String payment_success = '$baseUrl/purchases/payment-success';

  // user event
  static String getNewMusicReleasesURI = '$baseUrl/songs/new';
  static String getRecommendedMusicsURI = '$baseUrl/songs/recommended';
  static String getMyPlaylistURI = '$baseUrl/playlists';
  static String getTrendingMusicsURI = '$baseUrl/songs/trending';
  //

  static String getAllPostURI = '$baseUrl/posts';
  static String createPostURI = '$baseUrl/posts';

  static String genresURI = '$baseUrl/genres';
  static String moodesURI = '$baseUrl/moods';


  //search
  static String searchUri = '$baseUrl/songs/searchSongs';
  static String createDonationsURI = '$baseUrl/donations';
  static String orderListURI = '$baseUrl/orders';

  // user event
  static String getMusicianHome = '$baseUrl/users/musician/dashboard';
  //
//status====
  static String updateStatuses = '$baseUrl/statuses';

  static String musicianDataURI = '$baseUrl/users/musician';

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
  static const String base = 'theme';
  static const String USER_ROLE = 'user';
  static const String MUSICIAN_ROLE = 'musician';
  static const String PAYPAL = 'paypal';
  static const String STRIPE = 'stripe';


  static const int STATUS_CODE_UNDEFINED = -1;




  static const List<String> categoryStatusList=["Inactive","Active" ];
  static const List<String> productUnitList=["Pcs","pair ","kg","g","liter","dozen","meter","foot" ];

  static const Map<String,String> calenderEventMap={
    "Federal Events":"getFederalEvents",
    "Zone Events":"getZoneEvents",
    "Chapter Events":"getChapterEvents",
    "Sub-Chapter Events":"getSubChapterEvents"
  };



}