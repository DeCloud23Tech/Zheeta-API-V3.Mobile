// part of 'downline_cubit.dart';
//
// enum DownlineStatus { initial, loading, loaded, error }
//
// class DownlineState extends Equatable {
//   final DownlineStatus status;
//   final UserDownlineListModel downlines;
//
//   const DownlineState({
//     this.status = DownlineStatus.initial,
//     this.downlines = const UserDownlineListModel(data: []),
//   });
//
//   DownlineState copyWith({
//     DownlineStatus? status,
//     UserDownlineListModel? downlines,
//   }) {
//     return DownlineState(
//       status: status ?? this.status,
//       downlines: downlines ?? this.downlines,
//     );
//   }
//
//   @override
//   List<Object?> get props => [status, downlines];
//
//   List<UserDownlineModel> get downlinesList => downlines.data;
// }
