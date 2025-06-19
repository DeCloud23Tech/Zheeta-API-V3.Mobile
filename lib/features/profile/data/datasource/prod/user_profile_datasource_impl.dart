import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';
import 'package:zheeta/features/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/request/update_user_profile_request.dart';

@prod
@Singleton(as: UserProfileDataSource)
class UserProfileDataSourceImpl implements UserProfileDataSource {
  final Api _api;

  UserProfileDataSourceImpl(this._api);

  @override
  Future<void> createUserProfileNew(CreateUserProfileRequest request) async {
    var response = await _api.dio.post('/user/profile',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200 && response.data?['statusCode'] == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  // @override
  // Future<AllUserProfileListModel> getAllUsersProfileNew(
  //     {required int roleType,
  //     required int pageNumber,
  //     required int pageSize}) async {
  //   var response = await _api.dio.get(
  //     '/user/get-all-users?PageNumber=$pageNumber&PageSize=$pageSize&roleType=$roleType',
  //     options: Options(
  //       contentType: Headers.jsonContentType,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     return AllUserProfileListModel.fromJson(response.data['data']);
  //   } else {
  //     throw DioException.badResponse(
  //         statusCode: response.data?['statusCode'] ?? 400,
  //         requestOptions: response.requestOptions,
  //         response: response);
  //   }
  // }

  @override
  Future<UserProfileModel?> getSingleUserProfileNew() async {
    var response = await _api.dio.get(
      '/user/get-single-user-profile',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

// @override
// Future<UserPostListModel> getUserActivityNew({
//   required int pageNumber,
//   required int pageSize,
//   String? userId,
// }) async {
//   // Construct the URL with optional `userId` parameter
//   final url = userId != null
//       ? '/activity-post/getPostsByUserId?userId=$userId&PageNumber=$pageNumber&PageSize=$pageSize'
//       : '/activity-post/getPostsByUserId?PageNumber=$pageNumber&PageSize=$pageSize';
//
//   // Make the API call
//   var response = await _api.dio.get(
//     url,
//     options: Options(
//       contentType: Headers.jsonContentType,
//     ),
//   );
//
//   // Check the response status
//   if (response.statusCode == 200) {
//     final List<dynamic> dataList = response.data['data'] ?? [];
//     final List<UserPostModel> posts = dataList
//         .map((item) => UserPostModel.fromJson(item as Map<String, dynamic>))
//         .toList();
//     return UserPostListModel(data: posts);
//   } else {
//     throw DioException.badResponse(
//         statusCode: response.data?['statusCode'] ?? 400,
//         requestOptions: response.requestOptions,
//         response: response);
//   }
// }
//
  @override
  Future<void> updateUserProfileNew(UpdateUserProfileRequest request) async {
    var response = await _api.dio.put('/user/update-user-profile',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));

    if (response.statusCode == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> updateUserProfilePictureNew(
      {required String userId, required MultipartFile file}) async {

    dynamic payload = {'userId': userId, 'file': file};
    payload = FormData.fromMap(payload as Map<String, dynamic>);
    var response = await _api.dio.put('/user/picture',
        options: Options(
          contentType: 'multipart/form-data',
        ),
        data: payload);
    print(response);
    if (response.statusCode == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> uploadCarouselImagesNew({
    required String userId,
    required List<MultipartFile> files,
    String? currentMediaUrl,
  }) async {
    // Determine the endpoint and payload based on whether currentMediaUrl is provided
    String url = currentMediaUrl != null
        ? '/user/replace-carousel-photo'
        : '/user/upload-profile-carousels';

    // Prepare the payload for the request
    var payload = {
      'userId': userId,
      if (currentMediaUrl != null) 'mediaFile': files,
      if (currentMediaUrl == null) 'mediaFiles': files,
    };

    if (currentMediaUrl != null) {
      payload['currentMediaUrl'] = currentMediaUrl;
    }

    // Convert the payload to FormData
    FormData formData = FormData.fromMap(payload);

    // Make the request
    var response = await _api.dio.request(
      url,
      options: Options(
        method: currentMediaUrl != null ? 'PUT' : 'POST',
        contentType: 'multipart/form-data',
      ),
      data: formData,
    );

    // Handle successful response
    if (response.statusCode == 200) {
      print('Image upload/replacement successful');
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<ViewProfileModel> visitUserProfileNew({required String userId}) async {
    var response = await _api.dio.get(
      '/user/view-profile/$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return ViewProfileModel.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
