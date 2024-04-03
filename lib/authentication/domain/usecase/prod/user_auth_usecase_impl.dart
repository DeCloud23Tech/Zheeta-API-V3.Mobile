// import 'package:injectable/injectable.dart';
// import 'package:zheeta/authentication/data/model/login_user_model.dart';
// import 'package:zheeta/authentication/data/model/register_user_model.dart';
// import 'package:zheeta/authentication/data/request/change_password_request.dart';
// import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
// import 'package:zheeta/authentication/data/request/login_request.dart';
// import 'package:zheeta/authentication/data/request/register_staff_request.dart';
// import 'package:zheeta/authentication/data/request/register_user_request.dart';
// import 'package:zheeta/authentication/data/request/reset_password_request.dart';
// import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart';
// import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart';

// @prod
// @LazySingleton(as: UserAuthUseCase)
// class UserAuthUseCaseImpl implements UserAuthUseCase {
//   final UserAuthRepository _repository;
//   UserAuthUseCaseImpl(this._repository);

//   @override
//   changePasswordUsecase(ChangePasswordRequest data) {
//     return _repository.changePasswordRepo(data);
//   }

//   @override
//   loginOAuthUsecase(LoginOAuthRequest data) {
//     return _repository.loginOAuthRepo(data);
//   }

//   @override
//   Future<LoginUserModel> loginUsecase(LoginRequest data) {
//     return _repository.loginRepo(data);
//   }

//   @override
//   registerStaffUsecase(RegisterStaffRequest data) {
//     return _repository.registerStaffRepo(data);
//   }

//   @override
//   Future<RegisterUserModel> registerUserUsecase(RegisterUserRequest data) {
//     return _repository.registerUserRepo(data);
//   }

//   @override
//   resetPasswordUsecase(ResetPasswordRequest data) {
//     return _repository.resetPasswordRepo(data);
//   }
// }
