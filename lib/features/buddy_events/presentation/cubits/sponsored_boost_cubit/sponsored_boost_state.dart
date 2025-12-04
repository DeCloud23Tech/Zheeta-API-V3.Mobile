part of 'sponsored_boost_cubit.dart';

enum SponsoredBoostStatus { initial, loading, loaded, error }

class SponsoredBoostState {
  final SponsoredBoostStatus status;
  final ProfileBoostListModel? boosts;
  final String? errorMessage;

  const SponsoredBoostState({
    required this.status,
    this.boosts,
    this.errorMessage,
  });

  factory SponsoredBoostState.initial() =>
      const SponsoredBoostState(status: SponsoredBoostStatus.initial);

  SponsoredBoostState copyWith({
    SponsoredBoostStatus? status,
    ProfileBoostListModel? boosts,
    String? errorMessage,
  }) {
    return SponsoredBoostState(
      status: status ?? this.status,
      boosts: boosts ?? this.boosts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
