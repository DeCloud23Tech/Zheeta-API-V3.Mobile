part of 'block_account_cubit.dart';

// Enum to represent the current state of blocking/unblocking
enum BlockStatus { initial, loading, success, failure }

class BlockAccountState extends Equatable {
  final BlockStatus status;
  final String? message;

  const BlockAccountState({
    this.status = BlockStatus.initial,
    this.message,
  });

  BlockAccountState copyWith({
    BlockStatus? status,
    String? message,
  }) {
    return BlockAccountState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
