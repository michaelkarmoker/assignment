part of 'shopping_cubit.dart';


final class ShoppingState extends Equatable {
  final bool loading;
  final bool isDefault;
  final String? selectedAddressType;
  final List<CountryData>? countryList;
  final List<City>? cityList;
  final CountryData? selectedCountry;
  final City? selectedCity;
  final List<Address>? addressList;
  final Address? selectedAddress;


  const ShoppingState({
    this.loading = false,
    this.isDefault = false,
    this.selectedAddressType,
    this.countryList,
    this.cityList,
    this.selectedCity,
    this.selectedCountry,
    this.addressList,
    this.selectedAddress


  });

  ShoppingState copyWith({
    bool? loading,
    bool? isDefault,
    String? selectedAddressType,
    List<CountryData>? countryList,
    List<City>? cityList,
    CountryData? selectedCountry,
    City? selectedCity,
    List<Address>? addressList,
    Address? selectedAddress

  }) {
    return ShoppingState(
      loading: loading ?? this.loading,
      isDefault: isDefault ?? this.isDefault,
      selectedAddressType: selectedAddressType ?? this.selectedAddressType,
      countryList: countryList ?? this.countryList,
      cityList: cityList ?? this.cityList,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      addressList: addressList ?? this.addressList,
      selectedAddress: selectedAddress ?? this.selectedAddress,

      // Added the missing comma here
    );
  }

  @override
  List<Object?> get props => [loading,selectedAddressType,countryList,cityList,selectedCity,selectedCountry,addressList,selectedAddress,isDefault];


}
