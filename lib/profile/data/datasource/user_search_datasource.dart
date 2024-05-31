import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';

abstract class UserSearchDataSource {
  Future<Either<ErrorResponse, MappedResponse>> searchUserByCustomer({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<ErrorResponse, MappedResponse>> findUserByAdminUsername({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<ErrorResponse, MappedResponse>> findUserByAdminEmail({
    required String email,
    required int pageNumber,
    required int pageSize,
  });

  Future<SearchUserByCustomerListModel> searchUserByCustomerNew({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<SearchUserByAdminListModel> findUserByAdminUsernameNew({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  Future<SearchUserByAdminListModel> findUserByAdminEmailNew({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
