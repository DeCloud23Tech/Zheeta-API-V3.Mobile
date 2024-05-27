import 'package:injectable/injectable.dart';
import '../bloc/nearby_bloc/nearby_cubit.dart';

@prod
@LazySingleton()
class NearbyViewModel {
  final NearbyCubit nearbyCubit;

  NearbyViewModel(this.nearbyCubit);

  void fetchProfiles() {
    nearbyCubit.getNearbyProfilesCubit();

  }

  NearbyState get state => nearbyCubit.state;

  Stream<NearbyState> get stateStream => nearbyCubit.stream;
}