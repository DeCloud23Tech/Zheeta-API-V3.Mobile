import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/enums/type_of_request.dart';
import 'package:zheeta/features/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/presentation/bloc/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/model/match_model.dart';
import 'package:zheeta/features/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/features/discover/domain/usecase/ref/match_criteria_usecases.dart';

part 'matches_state.dart';

@prod
@LazySingleton()
class MatchesCubit extends Cubit<MatchesState> {
  final GetMatches getMatches;
  final PopulateMatches populateMatches;
  final IgnoreBulkMatches ignoreBulkMatches;
  final FriendsCubit friendsCubit;

  List<MatchModel> mutableMatches = [];
  List<MatchModel> swipedUpMatches = [];
  List<MatchModel> swipedRightMatches = [];
  List<MatchModel> swipedLeftMatches = [];

  MatchesCubit({
    required this.getMatches,
    required this.populateMatches,
    required this.ignoreBulkMatches,
    required this.friendsCubit,
  }) : super(MatchesInitialState());


  Future<void> getMatchCubit({required String userId}) async {
    print('get new matches');
    emit(MatchesLoadingState());

    // Clear swiped lists before fetching new matches
    swipedUpMatches.clear();
    swipedRightMatches.clear();
    swipedLeftMatches.clear();

    var result = await getMatches(userId);
    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        mutableMatches = List<MatchModel>.from(success.data!);
        emit(MatchesGottenState(success));
      },
    );
  }

  void removeMatchAt(int index, AxisDirection direction) {
    if (index < mutableMatches.length) {
      final match = mutableMatches[index];

      // Add the match to the appropriate list based on the direction
      if (direction == AxisDirection.up) {
        swipedUpMatches.add(match);
      } else if (direction == AxisDirection.right) {
        swipedRightMatches.add(match);
      } else if (direction == AxisDirection.left) {
        swipedLeftMatches.add(match);
      }
    }
  }

  void onNavigate() async {
    print('Swiped Up Matches: $swipedUpMatches');
    print('Swiped Right Matches: $swipedRightMatches');
    print('Swiped Left Matches: $swipedLeftMatches');

    // Step 1: Process swiped-left matches (ignoring users)
    final ignoreUsersList =
        swipedLeftMatches.map((match) => match.id as String).toList();

    if (ignoreUsersList.isNotEmpty) {
      emit(MatchesLoadingState());
      try {
        await ignoreBulkMatchesCubit(ignoreUsersList: ignoreUsersList);
        print('Ignored matches successfully: $ignoreUsersList');
      } catch (e) {
        print('Failed to ignore matches: $e');
      }
    }

    // Step 2: Process swiped-right and swiped-up matches (bulk friend requests)
    await processSwipedMatches();

    // Final State Transition
    emit(MatchesFriendRequestSentState());
  }

  Future<void> populateMatchesCubit() async {
    emit(MatchesLoadingState());
    print('populateMatches');
    var result = await populateMatches();

    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        emit(MatchesPopulatedState());
      },
    );
  }

  Future<void> ignoreBulkMatchesCubit(
      {required List<String> ignoreUsersList}) async {
    emit(MatchesLoadingState());
    print('Ignoring bulk matches');

    var result = await ignoreBulkMatches(ignoreUsersList);
    result.fold(
      (fail) {
        // Emit an error state if the operation fails
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        // Emit a success state if the operation succeeds
        emit(MatchesIgnoredState());
      },
    );
  }

  Future<void> processSwipedMatches() async {
    // Prepare swiped-right and swiped-up matches for bulk friend request
    final swipedRightRequests = swipedRightMatches
        .map((match) => BulkFriendRequestModel(
            recieverId: match.id, typeOfRequest: TypeOfRequest.friendRequest.value))
        .toList();

    final swipedUpRequests = swipedUpMatches
        .map((match) => BulkFriendRequestModel(
            recieverId: match.id, typeOfRequest: TypeOfRequest.superLike.value))
        .toList();

    // Combine the requests
    final combinedRequests = [...swipedRightRequests, ...swipedUpRequests];

    if (combinedRequests.isNotEmpty) {
      emit(MatchesLoadingState());
      try {
        // Call the bulk friend request function from the FriendsCubit
        await friendsCubit.sendBulkFriendRequestsCubit(
            friendList: combinedRequests);
        print('Bulk friend requests sent successfully: $combinedRequests');
      } catch (e) {
        print('Failed to send bulk friend requests: $e');
        emit(MatchesErrorState('Failed to send bulk friend requests.'));
      }
    } else {
      print('No matches to process for bulk friend requests.');
    }
  }
}
