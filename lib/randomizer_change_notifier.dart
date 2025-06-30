import 'dart:math';

import 'package:flutter/foundation.dart';

// How do we access the object of this
// class from the other widgets?
// We need to make this class available
// across our widgets.
// Two ways: Provider and Riverpod

// Provider has some limitation, and
// sometimes it is difficult to work
// with, therefore Riverpod was born.

// We will wrap our MaterialApp

// This will be a single class
// that contains our state
class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int? _generatedNumber;
  int? get generatedNumber => _generatedNumber;

  int min = 0, max = 0;

  void generateRandomNumber() {
    _generatedNumber = _randomGenerator.nextInt(max + 1 - min) + min;
    // Will trigger all the builders
    // of this RandomizerChangeNotifier
    // to re-run with the updated value
    notifyListeners();
  }
}
