import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/connections/data/models/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/domain/usecases/match_criteria_usecases.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

part 'matches_state.dart';

@prod
@LazySingleton()
class MatchesCubit extends Cubit<MatchesState> {
  final GetMatches getMatches;
  final PopulateMatches populateMatches;
  final IgnoreBulkMatches ignoreBulkMatches;
  final FriendsCubit friendsCubit;

  // ✅ Mutable lists for swipes (ideally move into state later)
  List<MatchModel> mutableMatches = [];
  List<MatchModel> swipedUpMatches = [];
  List<MatchModel> swipedRightMatches = [];
  List<MatchModel> swipedLeftMatches = [];

  MatchesCubit({
    required this.getMatches,
    required this.populateMatches,
    required this.ignoreBulkMatches,
    required this.friendsCubit,
  }) : super(const MatchesInitialState());

  /// Fetch new matches from backend
  Future<void> getMatchCubit({required String userId}) async {
    print('📡 Fetching new matches for userId=$userId');
    emit(MatchesDataState(
      currentMatches: state.currentMatches,
      isLoading: true,
      errorMessage: null,
    ));

    // Reset swipes when fetching new matches
    swipedUpMatches.clear();
    swipedRightMatches.clear();
    swipedLeftMatches.clear();

    var result = await getMatches(userId);
    result.fold(
      (fail) {
        print("❌ Failed to fetch matches: ${fail.message}");
        emit(MatchesDataState(
          currentMatches: state.currentMatches,
          isLoading: false,
          errorMessage: fail.message,
        ));
      },
      (success) {
        mutableMatches = List<MatchModel>.from(success.data!);
        print("✅ Matches fetched: ${mutableMatches.length}");
        emit(MatchesGottenState(success));
      },
    );
  }

  /// Handle swipe event, store in appropriate list, and remove from current matches
  void removeMatchAt(int index, AxisDirection direction) {
    if (index < mutableMatches.length) {
      final match = mutableMatches[index];

      // Track swipe direction
      if (direction == AxisDirection.up) {
        swipedUpMatches.add(match);
        print("⬆️ Super-liked: ${match.id}");
      } else if (direction == AxisDirection.right) {
        swipedRightMatches.add(match);
        print("➡️ Liked: ${match.id}");
      } else if (direction == AxisDirection.left) {
        swipedLeftMatches.add(match);
        print("⬅️ Ignored: ${match.id}");
      }

      // Remove swiped card from deck
      mutableMatches.removeAt(index);

      emit(MatchesDataState(
        currentMatches:
            MatchListModel(data: List<MatchModel>.from(mutableMatches)),
        isLoading: false,
        errorMessage: null,
      ));
    }
  }

  /// Process swiped matches when leaving the page
  void onNavigate() async {
    // ✅ Guard clause — skip if nothing swiped
    if (swipedUpMatches.isEmpty &&
        swipedRightMatches.isEmpty &&
        swipedLeftMatches.isEmpty) {
      print("🚪 Leaving page with no swipes → skipping API calls.");
      return;
    }

    print("🚪 Leaving page → processing swipes...");
    print('⬆️ Swiped Up Matches: $swipedUpMatches');
    print('➡️ Swiped Right Matches: $swipedRightMatches');
    print('⬅️ Swiped Left Matches: $swipedLeftMatches');

    emit(MatchesDataState(
      currentMatches: state.currentMatches,
      isProcessingRequests: true,
      errorMessage: null,
    ));

    try {
      // Step 1: Process ignored users
      final ignoreUsersList =
          swipedLeftMatches.map((match) => match.id as String).toList();

      if (ignoreUsersList.isNotEmpty) {
        await ignoreBulkMatches(ignoreUsersList);
        print('✅ Ignored matches sent to API: $ignoreUsersList');
      }

      // Step 2: Process liked/super-liked users
      await _processSwipedMatchesInternal();

      emit(MatchesFriendRequestSentState(
        currentMatches: state.currentMatches,
        isProcessingRequests: false,
        errorMessage: null,
      ));

      // ✅ Clear swipe lists after sync
      swipedUpMatches.clear();
      swipedRightMatches.clear();
      swipedLeftMatches.clear();
      print("🧹 Cleared swipe lists after processing.");
    } catch (e) {
      print('❌ Failed to process swiped matches: $e');
      emit(MatchesDataState(
        currentMatches: state.currentMatches,
        errorMessage: 'Failed to process matches: ${e.toString()}',
        isProcessingRequests: false,
      ));
    }
  }

  /// Populate matches (preload or refresh deck)
  Future<void> populateMatchesCubit({required String userId}) async {
    emit(MatchesDataState(
      currentMatches: state.currentMatches,
      isLoading: true,
      errorMessage: null,
    ));
    print('populateMatches');

    var result = await populateMatches();

    result.fold(
      (fail) {
        emit(MatchesDataState(
          currentMatches: state.currentMatches,
          isLoading: false,
          errorMessage: fail.message,
        ));
      },
      (_) async {
        print("✅ Matches populated successfully, fetching updated matches...");
        // After populate succeeds, fetch fresh matches
        await getMatchCubit(userId: userId);
      },
    );
  }

  /// Send bulk friend requests (right = like, up = super-like)
  Future<void> _processSwipedMatchesInternal() async {
    final swipedRightRequests = swipedRightMatches
        .map((match) => BulkFriendRequestModel(
            recieverId: match.id,
            typeOfRequest: TypeOfRequest.friendRequest.value))
        .toList();

    final swipedUpRequests = swipedUpMatches
        .map((match) => BulkFriendRequestModel(
            recieverId: match.id, typeOfRequest: TypeOfRequest.superLike.value))
        .toList();

    final combinedRequests = [...swipedRightRequests, ...swipedUpRequests];

    if (combinedRequests.isNotEmpty) {
      await friendsCubit.sendBulkFriendRequestsCubit(
          friendList: combinedRequests);
      print('✅ Bulk friend requests sent: $combinedRequests');
    } else {
      print('ℹ️ No matches to process for bulk friend requests.');
    }
  }

  /// Ignore a batch of users explicitly
  Future<void> ignoreBulkMatchesCubit(
      {required List<String> ignoreUsersList}) async {
    print('📡 Sending ignore bulk matches...');
    emit(MatchesDataState(
      currentMatches: state.currentMatches,
      isLoading: true,
      errorMessage: null,
    ));

    var result = await ignoreBulkMatches(ignoreUsersList);

    result.fold(
      (fail) {
        print("❌ Failed to ignore matches: ${fail.message}");
        emit(MatchesDataState(
          currentMatches: state.currentMatches,
          isLoading: false,
          errorMessage: fail.message,
        ));
      },
      (success) {
        print("✅ Matches ignored successfully.");
        emit(MatchesIgnoredState(
          currentMatches: state.currentMatches,
          isLoading: false,
          errorMessage: null,
        ));
      },
    );
  }
}
