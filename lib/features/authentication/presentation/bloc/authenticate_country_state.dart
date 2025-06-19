part of 'authenticate_country_cubit.dart';

class AuthenticateCountryState extends Equatable {
  final List<CountryModel> countries;
  final CountryDetailModel? selectedCountryDetails;
  final String? errorMessage;
  final bool isLoading;

  const AuthenticateCountryState({
    this.countries = const [],
    this.selectedCountryDetails,
    this.errorMessage,
    this.isLoading = false,
  });

  AuthenticateCountryState copyWith({
    List<CountryModel>? countries,
    CountryDetailModel? selectedCountryDetails,
    String? errorMessage,
    bool? isLoading,
  }) {
    return AuthenticateCountryState(
      countries: countries ?? this.countries,
      selectedCountryDetails: selectedCountryDetails ?? this.selectedCountryDetails,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [countries, selectedCountryDetails, errorMessage, isLoading];
}
