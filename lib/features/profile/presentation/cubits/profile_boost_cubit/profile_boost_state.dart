part of 'profile_boost_cubit.dart';

sealed class ProfileBoostState extends Equatable {
  const ProfileBoostState();

  @override
  List<Object> get props => [];
}

// Initial State
final class ProfileBoostInitial extends ProfileBoostState {}

// Loading State
final class ProfileBoostLoading extends ProfileBoostState {}

// Loaded State for Profile Boost List
final class ProfileBoostListLoaded extends ProfileBoostState {
  final ProfileBoostListModel profileBoostList;

  const ProfileBoostListLoaded(this.profileBoostList);

  @override
  List<Object> get props => [profileBoostList];
}

// Loaded State for Profile Boost Insight
final class ProfileBoostInsightLoaded extends ProfileBoostState {
  final BoostInsightModel boostInsight;

  const ProfileBoostInsightLoaded(this.boostInsight);

  @override
  List<Object> get props => [boostInsight];
}

// Error State
final class ProfileBoostError extends ProfileBoostState {
  final String message;

  const ProfileBoostError(this.message);

  @override
  List<Object> get props => [message];
}

// Profile Boost Creation Success
final class ProfileBoostCreated extends ProfileBoostState {}

// Cost calculated
final class ProfileBoostCostCalculated extends ProfileBoostState {
  final double totalCost;

  const ProfileBoostCostCalculated(this.totalCost);

  @override
  List<Object> get props => [totalCost];
}
