import 'package:flutter/material.dart';

mixin TabStateMixin<T extends StatefulWidget> on State<T> {
  int activeTab = 1;
  int currentIndex = 0;

  void updateActiveTab(int tabIndex) {
    setState(() {
      activeTab = tabIndex;
    });
  }

  void updateCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
