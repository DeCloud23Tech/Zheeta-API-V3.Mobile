part of 'nearby_cubit.dart';

abstract class NearbyState extends Equatable {
  const NearbyState();
}

class NearbyInitial extends NearbyState {
  @override
  List<Object> get props => [];
}

class NearbyLoading extends NearbyState {
  @override
  List<Object> get props => [];
}

class NearbyError extends NearbyState {
  final String errorMessage;

  const NearbyError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NearbySuccess extends NearbyState {
  final NearbyListModel data;

  const NearbySuccess(this.data);

  @override
  List<Object> get props => [data];
}
