import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/buddy_events/data/datasources/i_event_verification_datasource.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_verification.dart';

@prod
@Singleton(as: IEventVerificationDataSource)
class EventVerificationDataSourceImpl implements IEventVerificationDataSource {
  final Api _api;

  EventVerificationDataSourceImpl(this._api);

  @override
  Future<BuddyEventVerification?> getBuddyEventVerificationById(
      {required String id}) async {
    var response = await _api.dio.get(
      '/buddy-event/verify/get/$id',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      if (data == null) {
        return null; // Handle null case gracefully
      }
      return BuddyEventVerification.fromJson(data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
