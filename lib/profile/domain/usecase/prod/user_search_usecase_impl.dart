// import 'package:injectable/injectable.dart';
// import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
// import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';
// import 'package:zheeta/profile/domain/repository/user_search_repository.dart';
// import 'package:zheeta/profile/domain/usecase/user_search_usecase.dart';

// @prod
// @LazySingleton(as: UserSearchUseCase)
// class UserSearchUseCaseImpl implements UserSearchUseCase {
//   final UserSearchRepository _repository;
//   UserSearchUseCaseImpl(this._repository);

//   @override
//   Future<SearchUserByAdminListModel> findUserByAdminEmailUseCase({required String email, required int pageNumber, required int pageSize}) {
//     return _repository.findUserByAdminEmailRepo(
//       email: email,
//       pageNumber: pageNumber,
//       pageSize: pageSize,
//     );
//   }

//   @override
//   Future<SearchUserByAdminListModel> findUserByAdminUsernameUseCase({required String username, required int pageNumber, required int pageSize}) {
//     return _repository.findUserByAdminUsernameRepo(
//       username: username,
//       pageNumber: pageNumber,
//       pageSize: pageSize,
//     );
//   }

//   @override
//   Future<SearchUserByCustomerListModel> searchUserByCustomerUseCase({required String username, required int pageNumber, required int pageSize}) {
//     return _repository.searchUserByCustomerRepo(
//       username: username,
//       pageNumber: pageNumber,
//       pageSize: pageSize,
//     );
//   }
// }
