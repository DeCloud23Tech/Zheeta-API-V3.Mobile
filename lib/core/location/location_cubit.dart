import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/location/location_repository.dart';
import 'package:zheeta/core/location/location_state.dart';

@prod
@LazySingleton()
class LocationCubit extends Cubit<LocationState> {
  final LocationRepository repository;

  LocationCubit(this.repository) : super(LocationInitial());

  Future<void> fetchLocation() async {
    emit(LocationLoading());

    try {
      final position = await repository.getCurrentLocation();

      if (position == null) {
        emit(LocationPermissionDenied());
        return;
      }

      emit(LocationLoaded(position));
    } catch (e) {
      emit(LocationError("Failed to fetch location"));
    }
  }
}
