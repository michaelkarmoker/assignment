part of 'shopping_cubit.dart';


final class ShoppingState extends Equatable {
  final bool loading;
  final String? selectedAddressType;
  final List<CountryData>? countryList;
  final List<City>? cityList;



  const ShoppingState({
    this.loading = false,
    this.selectedAddressType,
    this.countryList,
    this.cityList,


  });

  ShoppingState copyWith({
    bool? loading,
    String? selectedAddressType,
    List<CountryData>? countryList,
    List<City>? cityList,

  }) {
    return ShoppingState(
      loading: loading ?? this.loading,
      selectedAddressType: selectedAddressType ?? this.selectedAddressType,
      countryList: countryList ?? this.countryList,
      cityList: cityList ?? this.cityList,

      // Added the missing comma here
    );
  }

  @override
  List<Object?> get props => [loading,selectedAddressType,countryList,cityList];


}
