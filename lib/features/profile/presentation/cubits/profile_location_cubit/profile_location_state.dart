part of 'profile_location_cubit.dart';

abstract class ProfileLocationState extends Equatable {
  const ProfileLocationState();

  @override
  List<Object?> get props => [];
}

class ProfileLocationInitial extends ProfileLocationState {}

class ProfileLocationLoadingState extends ProfileLocationState {}

class ProfileGotAddressLocationState extends ProfileLocationState {
  final AddressFromLocationModel addressFromLocation;

  const ProfileGotAddressLocationState(this.addressFromLocation);

  @override
  List<Object?> get props => [addressFromLocation];
}

class ProfileGotLocationCoordinateState extends ProfileLocationState {}

class ProfileLocationErrorState extends ProfileLocationState {
  final String errorMessage;

  const ProfileLocationErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
