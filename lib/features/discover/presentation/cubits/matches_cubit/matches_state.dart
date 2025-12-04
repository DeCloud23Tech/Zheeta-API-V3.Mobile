part of 'matches_cubit.dart';

// Base abstract class for all Matches states
abstract class MatchesState extends Equatable {
  final MatchListModel? currentMatches; // Keep the current list of matches
  final String? errorMessage;
  final bool isLoading; // A flag for general loading
  final bool
      isProcessingRequests; // A flag for processing friend requests specifically

  const MatchesState({
    this.currentMatches,
    this.errorMessage,
    this.isLoading = false,
    this.isProcessingRequests = false,
  });

  @override
  List<Object?> get props => [
        currentMatches,
        errorMessage,
        isLoading,
        isProcessingRequests,
      ];

  // Abstract copyWith method to be implemented by concrete states
  MatchesState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingRequests,
  });
}

// Initial state, no data, not loading, no error
class MatchesInitialState extends MatchesState {
  const MatchesInitialState();

  @override
  MatchesInitialState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingRequests,
  }) {
    return MatchesInitialState(); // Initial state doesn't really need to carry data
  }
}

// The primary state that holds data and can indicate various statuses
class MatchesDataState extends MatchesState {
  // Use constructor to initialize base class properties
  const MatchesDataState({
    super.currentMatches,
    super.errorMessage,
    super.isLoading,
    super.isProcessingRequests,
  });

  @override
  MatchesDataState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingRequests,
  }) {
    return MatchesDataState(
      currentMatches: currentMatches ?? this.currentMatches,
      errorMessage: errorMessage, // Nullify error if not provided
      isLoading: isLoading ?? this.isLoading,
      isProcessingRequests: isProcessingRequests ?? this.isProcessingRequests,
    );
  }

  // Helper getters for convenience
  bool get hasMatches =>
      currentMatches != null && currentMatches!.data!.isNotEmpty;
  List<MatchModel> get matches => currentMatches?.data ?? [];
}

// Specific state for when matches have just been gotten (can be a MatchesDataState too)
// This can be used for specific UI reactions if needed, but often MatchesDataState suffices.
class MatchesGottenState extends MatchesDataState {
  const MatchesGottenState(MatchListModel data)
      : super(currentMatches: data, isLoading: false);

  @override
  MatchesGottenState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading, // Keep this for clarity, though it's usually false here
    bool? isProcessingRequests,
  }) {
    return MatchesGottenState(
      currentMatches ?? this.currentMatches!,
    );
  }
}

// Specific state for when matches have just been populated (e.g., initial creation)
class MatchesPopulatedState extends MatchesDataState {
  const MatchesPopulatedState({
    super.currentMatches,
    super.errorMessage,
    super.isLoading,
    super.isProcessingRequests,
  });

  @override
  MatchesPopulatedState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingRequests,
  }) {
    return MatchesPopulatedState(
      currentMatches: currentMatches ?? this.currentMatches,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isProcessingRequests: isProcessingRequests ?? this.isProcessingRequests,
    );
  }
}

// State indicating that friend requests have been sent (after onNavigate)
class MatchesFriendRequestSentState extends MatchesDataState {
  const MatchesFriendRequestSentState({
    super.currentMatches,
    super.errorMessage,
    super.isLoading,
    super.isProcessingRequests = false, // Explicitly false for this state
  });

  @override
  MatchesFriendRequestSentState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingRequests,
  }) {
    return MatchesFriendRequestSentState(
      currentMatches: currentMatches ?? this.currentMatches,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isProcessingRequests: isProcessingRequests ?? this.isProcessingRequests,
    );
  }
}

// State indicating that matches were ignored (after ignoreBulkMatchesCubit)
class MatchesIgnoredState extends MatchesDataState {
  const MatchesIgnoredState({
    super.currentMatches,
    super.errorMessage,
    super.isLoading,
    super.isProcessingRequests,
  });

  @override
  MatchesIgnoredState copyWith({
    MatchListModel? currentMatches,
    String? errorMessage,
    bool? isLoading,
    bool? isProcessingRequests,
  }) {
    return MatchesIgnoredState(
      currentMatches: currentMatches ?? this.currentMatches,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isProcessingRequests: isProcessingRequests ?? this.isProcessingRequests,
    );
  }
}
