import 'dart:convert';
/// success : true
/// message : "OK"
/// data : [{"countryId":2,"countryKey":"00000000-0000-0000-0000-000000000000","countryName":"United Arab Emirates","iso":null,"flag":"uae-flag.png"}]

CountryListResponse countryListResponseFromJson(String str) => CountryListResponse.fromJson(json.decode(str));
String countryListResponseToJson(CountryListResponse data) => json.encode(data.toJson());
class CountryListResponse {
  CountryListResponse({
      this.success, 
      this.message, 
      this.data,});

  CountryListResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CountryData.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<CountryData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// countryId : 2
/// countryKey : "00000000-0000-0000-0000-000000000000"
/// countryName : "United Arab Emirates"
/// iso : null
/// flag : "uae-flag.png"

CountryData dataFromJson(String str) => CountryData.fromJson(json.decode(str));
String dataToJson(CountryData data) => json.encode(data.toJson());
class CountryData {
  CountryData({
      this.countryId, 
      this.countryKey, 
      this.countryName, 

      });

  CountryData.fromJson(dynamic json) {
    countryId = json['countryId'];
    countryKey = json['countryKey'];
    countryName = json['countryName'];

  }
  int? countryId;
  String? countryKey;
  String? countryName;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countryId'] = countryId;
    map['countryKey'] = countryKey;
    map['countryName'] = countryName;

    return map;
  }

  // Override equality
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CountryData && countryId == other.countryId;

  @override
  int get hashCode => countryId.hashCode;

}