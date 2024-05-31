// import 'package:injectable/injectable.dart';
// import 'package:zheeta/app/common/type_def.dart';
// import 'package:zheeta/profile/data/model/address_from_location_model.dart';
// import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';
// import 'package:zheeta/profile/domain/repository/location_repository.dart';
// import 'package:zheeta/profile/domain/usecase/location_usecase.dart';

// @prod
// @LazySingleton(as: LocationUseCase)
// class LocationUseCaseImpl implements LocationUseCase {
//   final LocationRepository _repository;
//   LocationUseCaseImpl(this._repository);

//   @override
//   ResultFuture<AddressFromLocationModel> getAddressFromLocationCoordinateUseCase({required double latitude, required double longitude}) {
//     return _repository.getAddressFromLocationCoordinateRepo(latitude: latitude, longitude: longitude);
//   }

//   @override
//   getLocationCoordinateFromAddressUseCase(LocationCoordinateFromAddressRequest request) {
//     return _repository.getLocationCoordinateFromAddressRepo(request);
//   }
// }
