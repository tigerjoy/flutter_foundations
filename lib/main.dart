import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:flutter_foundations/range_selector_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// The drawbacks of the Provider package
// are that,
// 1. We always have to wrap the widget
// where we need to make use of the provider
// within a Provider() class. When we have to
// use multiple providers this becomes a
// problem and the code starts to look bad
// fast.
// 2. The Provider package makes use of
// the type to fetch the corresponding
// object. What happens if we have two
// objects of the same type. Then we cannot
// access both from the same provider. We
// will end up accessing the closest provided
// instance.

// To solve the above problems we make use of
// the Riverpod package that helps us with
// clean access to the provided objects.

void main() {
  // Like AppWidget() is scoped to just
  // main()
  runApp(const AppWidget());
}

// This is no more global than
// a class is global

// Their definition is global, but
// their instances are scoped

// When we try to access this provider,
// and it is not yet created, then it
// gets scoped
final randomizerProvider = ChangeNotifierProvider(
  (ref) => RandomizerChangeNotifier(),
);

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // The ProviderScope() has to be added
    // here to bootstrap the Riverpod
    // containers
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        home: RangeSelectorPage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        ),
      ),
    );
  }
}
