import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'randomizer_state_notifier.freezed.dart';

// This is an example of immutable
// state management solution.

// When using StateNotifier we have
// two kinds of classes.
// 1. State classes
// 2. StateNotifier which is responsible
// for emitting the different states

// Since this is a simple State, and
// we are not dealing with HTTP requests
// or asynchronous activity, we use a single
// state like this.

// When we will be dealing with asynchronous
// activities (Futures, Streams etc), then
// we can make use of Freezed Unions for
// Loading, Loaded, Error states
@freezed
abstract class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? generatedNumber,
  }) = _RandomizerState;
}

// This conventionally should not
// contain properties, rather it should
// contains methods / actions
// (redux terminology) to create a new state

// Also if we were to use setters here
// instead of normal methods, then it
// would cause confusion since a
// StateNotifier is an immutable state
// management solution. But it is possible
// to use setters.
class RandomizerStateNotifier extends StateNotifier<RandomizerState> {
  // To the super constructor we pass
  // the initial state
  RandomizerStateNotifier() : super(RandomizerState());

  final _randomGenerator = Random();

  // Every notifier has a state field
  // of the type RandomizerState (T
  // specified after StateNotifier)

  // To change the state we have to set
  // the state with a copy of the previous
  // state with modifications.

  // We no longer need to explicitly call
  // notifyListeners() ourselves,
  // StateNotifier does that for us
  // automatically whenever the state is
  // reassigned with a different object.

  // Since the changes are sent rather
  // than the state being changed
  // in-place therefore we can also
  // create a history of the changes
  // for Undo / Redo operations.
  void generateRandomNumber() {
    state = state.copyWith(
      generatedNumber:
          state.min + _randomGenerator.nextInt(state.max + 1 - state.min),
    );
  }

  void setMin(int value) {
    state = state.copyWith(min: value);
  }

  void setMax(int value) {
    state = state.copyWith(max: value);
  }
}
