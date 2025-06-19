part of 'sponsored_boost_cubit.dart';

abstract class SponsoredBoostState extends Equatable {
  const SponsoredBoostState();
}

final class SponsoredBoostInitial extends SponsoredBoostState {
  @override
  List<Object> get props => [];
}


class SponsoredBoostLoadingState extends SponsoredBoostState {
  @override
  List<Object?> get props => [];
}

class SponsoredBoostErrorState extends SponsoredBoostState {
  final String message;

  const SponsoredBoostErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class SponsoredBoostLoadedState extends SponsoredBoostState {
  final ProfileBoostListModel boosts;

  const SponsoredBoostLoadedState({
    required this.boosts,
  });

  SponsoredBoostLoadedState copyWith({
    ProfileBoostListModel? boosts,
  }) {
    return SponsoredBoostLoadedState(
      boosts: boosts ?? this.boosts,
    );
  }

  @override
  List<Object?> get props => [boosts];
}
