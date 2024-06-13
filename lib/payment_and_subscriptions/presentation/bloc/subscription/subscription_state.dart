part of 'subscription_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();
}

class SubscriptionInitial extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionsLoading extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionsError extends SubscriptionState {
  final String errorMessage;

  const SubscriptionsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SubscriptionsSuccess extends SubscriptionState {
  final SubscriptionListModel subscriptions;

  const SubscriptionsSuccess(this.subscriptions);

  @override
  List<Object> get props => [subscriptions];
}
