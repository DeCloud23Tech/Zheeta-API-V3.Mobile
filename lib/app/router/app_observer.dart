import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/discover/presentation/viewmodel/friend_request_viewmodel.dart';
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart';
import 'package:zheeta/main.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) async {
    if (previousRoute != null) {
      print('Old route pushed: ${previousRoute.settings.name}');
      if (previousRoute.settings.name == "HomeRoute") {
        final context = scaffoldMessengerKey.currentContext!;
        var matchCriteriaViewModel = locator<MatchCriteriaViewModel>();
        var friendRequestViewModel = locator<FriendRequestViewModel>();
        await matchCriteriaViewModel.bulkIgnoreMatches(context);
        await friendRequestViewModel.sendBulkFriendRequest(context);
      }
    }
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
