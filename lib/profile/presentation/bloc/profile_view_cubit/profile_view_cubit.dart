import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../activity/data/models/activity_model.dart';
import '../../../data/model/view_profile_model.dart';
import '../../../domain/usecase/ref_usecases/user_profile_usecases.dart';

part 'profile_view_state.dart';

@prod
@LazySingleton()
class ProfileViewCubit extends Cubit<ProfileViewState> {
  final VisitUserProfile visitUserProfile;
  final GetVisitedUserRecentActivity getVisitedUserRecentActivity;

  ProfileViewCubit({
    required this.visitUserProfile,
    required this.getVisitedUserRecentActivity,
  }) : super(ProfileViewInitial());

  Future<ViewProfileModel?> visitUserProfileCubit(String userId) async {
    emit(ProfileViewLoading());

    var result = await visitUserProfile(userId);
    return result.fold(
      (fail) {
        emit(ProfileViewError(fail.message));
        return null;
      },
      (success) {
        emit(ProfileViewedState(success));
        print(userId);
        // getVisitedUserRecentActivityCubit(userId: userId, currentPage: 1);

        return success;
      },
    );
  }

  Future<void> getVisitedUserRecentActivityCubit({
    required String userId,
    required int currentPage,
    int? pageSize = 5,
  }) async {
    final currentState = state;

    if (currentState is ProfileViewCompositeState) {
      if (currentState.isFetching || currentState.hasReachedMax) {
        print('Request already in progress or max pages reached.');
        return;
      }

      emit(currentState.copyWith(isFetching: true));

      try {
        List<ActivityModel> recentActivities;

        if (currentPage == 1) {
          print('Fetching initial page: $currentPage');
          recentActivities = await _fetchVisitedUserRecentActivity(
              userId, currentPage, pageSize!);
          emit(
            currentState.copyWith(
              recentActivities: ActivityListModel(data: recentActivities),
              currentPage: currentPage + 1,
              isFetching: false,
              hasReachedMax: recentActivities.isEmpty,
            ),
          );
        } else {
          print('Fetching next page: ${currentState.currentPage}');
          recentActivities = await _fetchVisitedUserRecentActivity(
              userId, currentState.currentPage, pageSize!);
          emit(
            recentActivities.isEmpty
                ? currentState.copyWith(hasReachedMax: true, isFetching: false)
                : currentState.copyWith(
                    recentActivities: ActivityListModel(
                      data: List.of(currentState.recentActivities.data ?? [])
                        ..addAll(recentActivities),
                    ),
                    currentPage: currentState.currentPage + 1,
                    isFetching: false,
                    hasReachedMax: recentActivities.isEmpty,
                  ),
          );
        }
      } catch (e) {
        print('Error fetching activities: $e');
        emit(ProfileViewError(e.toString()));
      }
    } else {
      print('Invalid state: $currentState');
    }
  }

  Future<List<ActivityModel>> _fetchVisitedUserRecentActivity(
      String userId, int pageNo, int pageSize) async {
    print('Fetching activities for user $userId, page number: $pageNo');
    var result = await getVisitedUserRecentActivity(
      GetVisitedUserRecentActivityParams(
          userId: userId, pageNo: pageNo, pageSize: pageSize),
    );
    return result.fold(
      (fail) => throw Exception('Error fetching recent activities'),
      (success) => success.data ?? [],
    );
  }
}
