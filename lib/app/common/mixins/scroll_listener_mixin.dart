import 'package:flutter/material.dart';

mixin ScrollListenerMixin<T extends StatefulWidget> on State<T> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.9) {
      // Handle scrolling to the end
    }
  }
}
