import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';

part 'user_profile_boost_state.freezed.dart';

@freezed
class UserProfileBoostState with _$UserProfileBoostState {
  factory UserProfileBoostState({
    required State createProfileBoostState,
    required State<MatchedProfileBoostListModel> getMatchedProfileBoostState,
    required State<BoostedProfileByAdminListModel> getBoostedProfileByAdminState,
  }) = _UserProfileBoostState;

  UserProfileBoostState._();

  UserProfileBoostState setCreateProfileBoostState(State state) => copyWith(createProfileBoostState: state);
  UserProfileBoostState setGetMatchedProfileBoostState(State<MatchedProfileBoostListModel> state) => copyWith(getMatchedProfileBoostState: state);
  UserProfileBoostState setGetBoostedProfileByAdminState(State<BoostedProfileByAdminListModel> state) => copyWith(getBoostedProfileByAdminState: state);
}
