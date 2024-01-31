import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void incrementCount() {
    count++;
    notifyListeners();
  }

  void decrementCount() {
    count--;
    notifyListeners();
  }
}