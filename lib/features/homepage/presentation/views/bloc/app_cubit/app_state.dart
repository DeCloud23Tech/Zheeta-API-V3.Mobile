part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppProfile extends AppState {
  final UserProfileModel? profile;

  const AppProfile({
    required this.profile,
  });
}

class AppLoaded extends AppState {
  final UserProfileModel? profile;
  final MatchListModel? data;

  const AppLoaded({
    required this.profile,
    this.data,
  });
}

class AppError extends AppState {
  final String message;

  const AppError(this.message);

  @override
  List<Object?> get props => [message];
}
