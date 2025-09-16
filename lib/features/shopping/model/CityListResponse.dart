class City {
  final int? cityId;
  final String? cityName;
  final String? arabicCityName;


  City({
      this.cityId,
      this.cityName,
      this.arabicCityName
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is City && cityId == other.cityId);

  @override
  int get hashCode => cityId.hashCode;
}
