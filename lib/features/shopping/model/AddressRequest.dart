import 'dart:convert';

/// memberShippingAddressId : 0
/// memberId : 1004
/// firstName : "John"
/// lastName : "Doe"
/// email : "john.doe@mail.com"
/// mobileNo : "+9710554836"
/// phoneCode : "+971"
/// addressLine1 : "Street Address"
/// addressLine2 : "Building Name"
/// cityId : 1
/// countryId : 1
/// zipCode : "12345"
/// isDefault : true

AddressRequest addressRequestFromJson(String str) => AddressRequest.fromJson(json.decode(str));
String addressRequestToJson(AddressRequest data) => json.encode(data.toJson());
class AddressRequest {
  AddressRequest({
      this.memberShippingAddressId, 
      this.memberId, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.mobileNo, 
      this.phoneCode, 
      this.addressLine1, 
      this.addressLine2, 
      this.cityId, 
      this.countryId, 
      this.zipCode, 
      this.isDefault,});

  AddressRequest.fromJson(dynamic json) {
    memberShippingAddressId = json['memberShippingAddressId'];
    memberId = json['memberId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    phoneCode = json['phoneCode'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    cityId = json['cityId'];
    countryId = json['countryId'];
    zipCode = json['zipCode'];
    isDefault = json['isDefault'];
  }
  int? memberShippingAddressId;
  String? memberId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNo;
  String? phoneCode;
  String? addressLine1;
  String? addressLine2;
  int? cityId;
  int? countryId;
  String? zipCode;
  bool? isDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['memberShippingAddressId'] = memberShippingAddressId;
    map['memberId'] = memberId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['mobileNo'] = mobileNo;
    map['phoneCode'] = phoneCode;
    map['addressLine1'] = addressLine1;
    map['addressLine2'] = addressLine2;
    map['cityId'] = cityId;
    map['countryId'] = countryId;
    map['zipCode'] = zipCode;
    map['isDefault'] = isDefault;
    return map;
  }
  @override
  String toString() {
    return 'AddressRequest('
        'memberShippingAddressId: $memberShippingAddressId, '
        'memberId: $memberId, '
        'firstName: $firstName, '
        'lastName: $lastName, '
        'email: $email, '
        'mobileNo: $mobileNo, '
        'phoneCode: $phoneCode, '
        'addressLine1: $addressLine1, '
        'addressLine2: $addressLine2, '
        'cityId: $cityId, '
        'countryId: $countryId, '
        'zipCode: $zipCode, '
        'isDefault: $isDefault'
        ')';
  }

}