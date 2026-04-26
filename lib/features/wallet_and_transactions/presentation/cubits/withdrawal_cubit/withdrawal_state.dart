part of 'withdrawal_cubit.dart';

abstract class WithdrawalState extends Equatable {
  final RateByCountry? currentRate; // The current exchange rate and currency
  final PayoutData? lastPayoutData; // The data from the last successful payout
  final String? errorMessage; // To hold an error message
  final bool isLoading; // To indicate if an operation is in progress

  const WithdrawalState({
    this.currentRate,
    this.lastPayoutData,
    this.errorMessage,
    this.isLoading = false, // Default to not loading
  });

  @override
  List<Object?> get props => [
        currentRate,
        lastPayoutData,
        errorMessage,
        isLoading,
      ];

  // A unified copyWith method for the base state.
  // This allows easy creation of new states from existing ones by modifying specific properties.
  WithdrawalState copyWith({
    RateByCountry? currentRate,
    PayoutData? lastPayoutData,
    String? errorMessage,
    bool? isLoading,
  });
}

// -----------------------------------------------------------------------------
// Concrete States
// Each concrete state defines a specific "status" by setting the base state's properties.
// They do NOT introduce new properties, only specific values for the inherited ones.
// -----------------------------------------------------------------------------

// 1. Initial State: No data, not loading, no error.
class WithdrawalInitial extends WithdrawalState {
  const WithdrawalInitial()
      : super(isLoading: false, errorMessage: null); // Explicitly set defaults

  @override
  WithdrawalInitial copyWith({
    RateByCountry? currentRate,
    PayoutData? lastPayoutData,
    String? errorMessage,
    bool? isLoading,
  }) {
    // For initial state, copyWith usually returns a new initial state
    // unless you want to transition it directly to a data-carrying state.
    // In a union state pattern, it's often more explicit to emit the target state.
    return const WithdrawalInitial();
  }
}

// 2. Loading State: An operation is in progress.
// Can optionally carry existing data while loading.
class WithdrawalLoading extends WithdrawalState {
  const WithdrawalLoading({
    super.currentRate,
    super.lastPayoutData,
    super.errorMessage, // Keep error if re-loading after an error
  }) : super(isLoading: true); // Crucially set isLoading to true

  @override
  WithdrawalLoading copyWith({
    RateByCountry? currentRate,
    PayoutData? lastPayoutData,
    String? errorMessage,
    bool?
        isLoading, // This will be ignored as isLoading is always true for this state
  }) {
    return WithdrawalLoading(
      currentRate: currentRate ?? this.currentRate,
      lastPayoutData: lastPayoutData ?? this.lastPayoutData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// 3. Rate Success State: Successfully fetched a rate.
// Sets currentRate, clears loading and error.
class WithdrawalRateLoaded extends WithdrawalState {
  // `rate` is passed as a required parameter to set `currentRate` in the super constructor
  const WithdrawalRateLoaded(RateByCountry rate)
      : super(currentRate: rate, isLoading: false, errorMessage: null);

  @override
  WithdrawalRateLoaded copyWith({
    RateByCountry? currentRate,
    PayoutData?
        lastPayoutData, // These are ignored as this state focuses on rate
    String? errorMessage, // These are ignored
    bool? isLoading, // These are ignored
  }) {
    // If you need to "copy" this state, you provide the new rate.
    // Other properties are typically not changed by copyWith on this specific state.
    return WithdrawalRateLoaded(currentRate ?? this.currentRate!);
  }
}

// 4. Payout Success State: Successfully processed a payout.
// Sets lastPayoutData, clears loading and error.
class WithdrawalPayoutSuccess extends WithdrawalState {
  // `payoutData` is passed as a required parameter to set `lastPayoutData` in the super constructor
  const WithdrawalPayoutSuccess(PayoutData payoutData)
      : super(lastPayoutData: payoutData, isLoading: false, errorMessage: null);

  @override
  WithdrawalPayoutSuccess copyWith({
    RateByCountry? currentRate, // Ignored
    PayoutData? lastPayoutData,
    String? errorMessage, // Ignored
    bool? isLoading, // Ignored
  }) {
    return WithdrawalPayoutSuccess(lastPayoutData ?? this.lastPayoutData!);
  }
}

// 5. Failure State: An operation failed.
// Sets errorMessage, clears loading, can preserve existing data.
class WithdrawalFailure extends WithdrawalState {
  // `message` is passed as a required parameter to set `errorMessage` in the super constructor
  const WithdrawalFailure(
    String message, {
    super.currentRate,
    super.lastPayoutData,
  }) : super(errorMessage: message, isLoading: false);

  @override
  WithdrawalFailure copyWith({
    RateByCountry? currentRate,
    PayoutData? lastPayoutData,
    String? errorMessage,
    bool? isLoading, // Ignored
  }) {
    return WithdrawalFailure(
      errorMessage ?? this.errorMessage!, // Ensure message is present
      currentRate: currentRate ?? this.currentRate,
      lastPayoutData: lastPayoutData ?? this.lastPayoutData,
    );
  }
}
