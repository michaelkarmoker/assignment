import 'package:assignment/features/shopping/model/CountryListResponse.dart';

import 'CityListResponse.dart';

import 'dart:convert';

/// memberShippingAddressId : 1004
/// memberAddressKey : "aa3e79fc-316a-4ef6-ac59-ba6524e198e0"
/// memberId : 1004
/// firstName : "John"
/// lastName : "Doe"
/// email : "john.doe@mail.com"
/// phoneCode : "+971"
/// mobileNo : "+9710554836"
/// addressLine1 : "Street Address"
/// addressLine2 : "Building Name"
/// cityId : 3
/// countryId : 2
/// zipCode : "12345"
/// status : "Active"
/// isDefault : true
/// lastUpdated : "2025-09-16T06:32:28.7745738"
/// member : null
/// city : {"cityId":3,"cityKey":"0b48705e-fd04-4e90-b9c1-a92a6ed599e8","cityName":"Abu Dhabi","cityNameAr":"أبوظبي","cityStatus":true,"countryId":2,"createdBy":1,"createdAt":"2025-08-27T05:31:08.8133333","updatedAt":"2025-08-27T05:31:08.8133333","country":{"countryId":2,"countryKey":"26ac7151-156b-41f4-a371-26b196ef9811","countryCode":"AE","countryName":"United Arab Emirates","arabicCountryName":"الإمارات العربية المتحدة","flag":"uae-flag.png","status":"Active","createdAt":"2025-08-27T05:25:07.47","updatedAt":"2025-08-27T05:25:07.47","createdBy":1,"updatedBy":1}}
/// country : {"countryId":2,"countryKey":"26ac7151-156b-41f4-a371-26b196ef9811","countryCode":"AE","countryName":"United Arab Emirates","arabicCountryName":"الإمارات العربية المتحدة","flag":"uae-flag.png","status":"Active","createdAt":"2025-08-27T05:25:07.47","updatedAt":"2025-08-27T05:25:07.47","createdBy":1,"updatedBy":1}

Address addressListResponseFromJson(String str) => Address.fromJson(json.decode(str));
String addressListResponseToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      this.memberShippingAddressId, 
      this.memberAddressKey, 
      this.memberId, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneCode, 
      this.mobileNo, 
      this.addressLine1, 
      this.addressLine2, 
      this.cityId, 
      this.countryId, 
      this.zipCode, 
      this.status, 
      this.isDefault, 
      this.lastUpdated,
      this.city, 
      this.country,});

  Address.fromJson(dynamic json) {
    memberShippingAddressId = json['memberShippingAddressId'];
    memberAddressKey = json['memberAddressKey'];
    memberId = json['memberId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneCode = json['phoneCode'];
    mobileNo = json['mobileNo'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    cityId = json['cityId'];
    countryId = json['countryId'];
    zipCode = json['zipCode'];
    status = json['status'];
    isDefault = json['isDefault'];
    lastUpdated = json['lastUpdated'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    country = json['country'] != null ? CountryData.fromJson(json['country']) : null;
  }
  int? memberShippingAddressId;
  String? memberAddressKey;
  int? memberId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneCode;
  String? mobileNo;
  String? addressLine1;
  String? addressLine2;
  int? cityId;
  int? countryId;
  String? zipCode;
  String? status;
  bool? isDefault;
  String? lastUpdated;
  City? city;
  CountryData? country;
  bool isSelect=false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['memberShippingAddressId'] = memberShippingAddressId;
    map['memberAddressKey'] = memberAddressKey;
    map['memberId'] = memberId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phoneCode'] = phoneCode;
    map['mobileNo'] = mobileNo;
    map['addressLine1'] = addressLine1;
    map['addressLine2'] = addressLine2;
    map['cityId'] = cityId;
    map['countryId'] = countryId;
    map['zipCode'] = zipCode;
    map['status'] = status;
    map['isDefault'] = isDefault;
    map['lastUpdated'] = lastUpdated;

    if (city != null) {
      map['city'] = city?.toJson();
    }
    if (country != null) {
      map['country'] = country?.toJson();
    }
    return map;
  }

}