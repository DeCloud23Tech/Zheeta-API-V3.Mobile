part of 'bottom_nav_cubit.dart';


sealed class BottomNavState extends Equatable {
  const BottomNavState();
}

final class BottomNavInitial extends BottomNavState {
  @override
  List<Object> get props => [];
}
