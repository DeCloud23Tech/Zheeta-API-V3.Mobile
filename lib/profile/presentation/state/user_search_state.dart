import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';

part 'user_search_state.freezed.dart';

@freezed
class UserSearchState with _$UserSearchState {
  factory UserSearchState({
    required State<SearchUserByCustomerListModel> searchUserByCustomerState,
    required State<SearchUserByAdminListModel> findUserByAdminUsernameState,
    required State<SearchUserByAdminListModel> findUserByAdminEmailState,
  }) = _UserSearchState;

  UserSearchState._();

  UserSearchState setSearchUserByCustomerState(State<SearchUserByCustomerListModel> state) => copyWith(searchUserByCustomerState: state);
  UserSearchState setFindUserByAdminUsernameState(State<SearchUserByAdminListModel> state) => copyWith(findUserByAdminUsernameState: state);
  UserSearchState setFindUserByAdminEmailState(State<SearchUserByAdminListModel> state) => copyWith(findUserByAdminEmailState: state);
}
