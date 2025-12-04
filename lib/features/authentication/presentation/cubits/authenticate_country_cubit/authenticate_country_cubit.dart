import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/authentication/data/models/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';
import 'package:zheeta/features/authentication/domain/usecases/user_country/user_country_usecases.dart';

part 'authenticate_country_state.dart';

@prod
@LazySingleton()
class AuthenticateCountryCubit extends Cubit<AuthenticateCountryState> {
  final GetAllCountries getAllCountries;
  final GetCountryDetails getCountryDetails;

  AuthenticateCountryCubit({
    required this.getAllCountries,
    required this.getCountryDetails,
  }) : super(const AuthenticateCountryState());

  Future<void> fetchAllCountries() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getAllCountries();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (countries) =>
          emit(state.copyWith(isLoading: false, countries: countries)),
    );
  }

  Future<void> fetchCountryDetails(String countryCode) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getCountryDetails(countryCode);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (country) => emit(
          state.copyWith(isLoading: false, selectedCountryDetails: country)),
    );
  }
}
