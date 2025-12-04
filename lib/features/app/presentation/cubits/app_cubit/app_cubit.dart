import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_verification_cubit/event_verification_cubit.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/presentation/cubits/matches_cubit/matches_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/subscription_cubit/subscription_cubit.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

part 'app_state.dart';

@prod
@LazySingleton()
class AppCubit extends Cubit<AppState> {
  final ProfileCubit profileCubit;
  final MatchesCubit matchesCubit;
  final EventVerificationCubit eventVerificationCubit;
  final SubscriptionCubit subscriptionCubit;

  AppCubit({
    required this.profileCubit,
    required this.matchesCubit,
    required this.eventVerificationCubit,
    required this.subscriptionCubit,
  }) : super(AppInitial());

  /// App initialization logic
  Future<void> initializeApp() async {
    emit(AppLoading());
    try {
      // Call the `getSingleUserProfileCubit` method from `ProfileCubit`
      var profile = await profileCubit.getSingleUserProfileCubit();
      final userProfile = profile?.data?.profile;
      final userCarousels = profile?.data?.userCarousels;
      // final user = profile?.data?.user;

      bool isProfileNotCompleted = userProfile == null ||
          userProfile.profilePhotoURL == null ||
          (userCarousels == null || userCarousels.isEmpty);
      // user?.isFullyVerified == true;

      if (profile?.data == null || isProfileNotCompleted) {
        emit(AppProfile(profile: profile));
        return; // Stop further execution to prevent state overwriting
      }

      // Initialize matches
      await matchesCubit.getMatchCubit(
          userId: profile?.data?.profile?.id ?? '');
      await subscriptionCubit.getAllSubscriptionCubit();
      // await eventVerificationCubit.fetchEventVerificationCubit(
      //     id: profile?.data?.profile?.id ?? '');

      emit(AppLoaded(profile: profile));
    } catch (error, stackTrace) {
      print('Error in AppCubit: $error');
      print(stackTrace);
      emit(AppError(error.toString()));
    }
  }

  void refreshMatches() async {
    String? userId = await TokenUtil.getUserId();
    if (userId != null) {
      matchesCubit.getMatchCubit(userId: userId);
    }
  }
}
