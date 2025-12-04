part of 'subscription_cubit.dart';

// Base abstract class for all Subscription states
abstract class SubscriptionState extends Equatable {
  final SubscriptionListModel? subscriptions; // All fetched subscriptions
  final String? errorMessage;
  final bool isLoading;
  final String? description; // For SubscriptionUpdated
  final String? feature; // For SubscriptionUpdated
  final SubscriptionModel? selectedSubscription; // For SubscriptionUpdated

  const SubscriptionState({
    this.subscriptions,
    this.errorMessage,
    this.isLoading = false,
    this.description,
    this.feature,
    this.selectedSubscription,
  });

  @override
  List<Object?> get props => [
        subscriptions,
        errorMessage,
        isLoading,
        description,
        feature,
        selectedSubscription,
      ];

  // Abstract copyWith for consistent state updates across all concrete states
  SubscriptionState copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage,
    bool? isLoading,
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  });
}

// Initial state, no data, no loading, no error
class SubscriptionInitial extends SubscriptionState {
  const SubscriptionInitial();

  @override
  List<Object> get props => []; // Still empty, as it's truly initial

  @override
  SubscriptionInitial copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage,
    bool? isLoading,
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  }) {
    return const SubscriptionInitial();
  }
}

// The primary state that holds data and can indicate various statuses
// All specific states will extend this or handle their properties explicitly.
class SubscriptionDataState extends SubscriptionState {
  const SubscriptionDataState({
    super.subscriptions,
    super.errorMessage,
    super.isLoading,
    super.description,
    super.feature,
    super.selectedSubscription,
  });

  @override
  SubscriptionDataState copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage,
    bool? isLoading,
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  }) {
    return SubscriptionDataState(
      subscriptions: subscriptions ?? this.subscriptions,
      errorMessage: errorMessage, // Explicitly nullify if not provided
      isLoading: isLoading ?? this.isLoading,
      description: description ?? this.description,
      feature: feature ?? this.feature,
      selectedSubscription: selectedSubscription ?? this.selectedSubscription,
    );
  }

  // Helper getter for convenience if needed
  bool get hasSubscriptions =>
      subscriptions != null && subscriptions!.data.isNotEmpty;
}

// Specific Loading state
class SubscriptionsLoadingState extends SubscriptionDataState {
  const SubscriptionsLoadingState({
    super.subscriptions, // Keep existing data if present during loading
    super.errorMessage,
  }) : super(isLoading: true); // Set isLoading to true

  @override
  SubscriptionsLoadingState copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage,
    bool? isLoading, // Ignored, as it's always true here
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  }) {
    return SubscriptionsLoadingState(
      subscriptions: subscriptions ?? this.subscriptions,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Specific Error state
class SubscriptionsErrorState extends SubscriptionDataState {
  const SubscriptionsErrorState({
    required super.errorMessage,
    super.subscriptions, // Keep existing data even on error
  }) : super(isLoading: false); // Set isLoading to false

  @override
  SubscriptionsErrorState copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage,
    bool? isLoading, // Ignored, as it's always false here
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  }) {
    return SubscriptionsErrorState(
      errorMessage: errorMessage ?? this.errorMessage!, // Ensure error message
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }
}

// Specific Success state
class SubscriptionsSuccessState extends SubscriptionDataState {
  const SubscriptionsSuccessState({
    required super.subscriptions,
  }) : super(
            isLoading: false,
            errorMessage: null); // Clear error and loading on success

  @override
  SubscriptionsSuccessState copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage, // Ignored, as it's null here
    bool? isLoading, // Ignored, as it's false here
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  }) {
    return SubscriptionsSuccessState(
      subscriptions: subscriptions ?? this.subscriptions!,
    );
  }
}

// State for when subscription details are updated/selected (like in your dialog)
class SubscriptionUpdatedState extends SubscriptionDataState {
  const SubscriptionUpdatedState({
    super.subscriptions, // Keep existing subscriptions list
    required super.description,
    required super.feature,
    required super.selectedSubscription,
  }) : super(isLoading: false, errorMessage: null); // Not a loading/error state

  @override
  SubscriptionUpdatedState copyWith({
    SubscriptionListModel? subscriptions,
    String? errorMessage,
    bool? isLoading,
    String? description,
    String? feature,
    SubscriptionModel? selectedSubscription,
  }) {
    return SubscriptionUpdatedState(
      subscriptions: subscriptions ?? this.subscriptions,
      description: description ?? this.description!,
      feature: feature ?? this.feature!,
      selectedSubscription: selectedSubscription ?? this.selectedSubscription!,
    );
  }
}
