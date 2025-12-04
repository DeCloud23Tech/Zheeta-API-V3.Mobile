import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:zheeta/features/profile/domain/usecases/user_profile_access_usecases.dart';

part 'block_account_state.dart';

@injectable
class BlockAccountCubit extends Cubit<BlockAccountState> {
  final BlockAccount blockAccount;
  final UnBlockAccount unBlockAccount;

  BlockAccountCubit({
    required this.blockAccount,
    required this.unBlockAccount,
  }) : super(const BlockAccountState());

  Future<void> blockUser(String userId, String blockUserId) async {
    print("block user");
    emit(state.copyWith(status: BlockStatus.loading));
    try {
      final result = await blockAccount(BlockUserParams(
        userId: userId,
        blockOrUnblockUserId: blockUserId,
      ));
      result.fold(
        (failure) => emit(state.copyWith(
            status: BlockStatus.failure, message: failure.toString())),
        (_) => emit(state.copyWith(
            status: BlockStatus.success, message: "User blocked successfully")),
      );
    } catch (e) {
      emit(state.copyWith(status: BlockStatus.failure, message: e.toString()));
    }
  }

  Future<void> unblockUser(String userId, String unblockUserId) async {
    emit(state.copyWith(status: BlockStatus.loading));
    try {
      final result = await unBlockAccount(BlockUserParams(
        userId: userId,
        blockOrUnblockUserId: unblockUserId,
      ));
      result.fold(
        (failure) => emit(state.copyWith(
            status: BlockStatus.failure, message: failure.toString())),
        (_) => emit(state.copyWith(
            status: BlockStatus.success,
            message: "User unblocked successfully")),
      );
    } catch (e) {
      emit(state.copyWith(status: BlockStatus.failure, message: e.toString()));
    }
  }
}
