class City {
  final int cityId;
  final String cityName;
  final String arabicCityName;
  final int countryId;
  final String countryName;
  final String countryNameAr;
  final String icon;

  City({
    required this.cityId,
    required this.cityName,
    required this.arabicCityName,
    required this.countryId,
    required this.countryName,
    required this.countryNameAr,
    required this.icon,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: json["cityId"],
      cityName: json["cityName"],
      arabicCityName: json["arabicCityName"],
      countryId: json["countryId"],
      countryName: json["countryName"],
      countryNameAr: json["countryNameAr"],
      icon: json["icon"],
    );
  }
}
