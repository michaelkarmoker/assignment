class City {
  final int cityId;
  final String cityName;
  final String arabicCityName;


  City({
    required this.cityId,
    required this.cityName,
    required this.arabicCityName
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json["cityId"],
      cityName: json["cityName"],
      arabicCityName: json["arabicCityName"]??json["cityNameAr"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cityId": cityId,
      "cityName": cityName,
      "arabicCityName": arabicCityName
    };
  }
}
