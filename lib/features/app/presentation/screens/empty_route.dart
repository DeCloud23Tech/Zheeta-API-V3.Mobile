import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EmptyScreen extends StatelessWidget implements AutoRouteWrapper {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter(); // Displays nested routes
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
