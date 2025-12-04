import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_search_datasource.dart';
import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';

@prod
@Singleton(as: IUserSearchDataSource)
class UserSearchDataSourceImpl implements IUserSearchDataSource {
  final Api _api;

  UserSearchDataSourceImpl(this._api);

  @override
  Future<SearchUserByCustomerListModel> searchUserByCustomerNew(
      {required String username,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/search/$username?&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SearchUserByCustomerListModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
