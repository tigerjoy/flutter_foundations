import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:flutter_foundations/range_selector_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // For using locally scoped providers
    // return MaterialApp(
    //   title: 'Randomizer',
    //   home: RandomizerFlow(),
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
    //   ),
    // );

    return ChangeNotifierProvider(
      // The RandomizerChangeNotifier()
      // is now accessible within all the
      // widgets on and below the
      // RangeSelectorPage() widget

      // Provide it above from where
      // you want to access it
      create: (context) => RandomizerChangeNotifier(),
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

// For using locally scoped providers
// class RandomizerFlow extends StatelessWidget {
//   const RandomizerFlow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       // The RandomizerChangeNotifier()
//       // is now accessible within all the
//       // widgets on and below the
//       // RangeSelectorPage() widget

//       // Provide it above from where
//       // you want to access it
//       create: (context) => RandomizerChangeNotifier(),
//       child: RangeSelectorPage(),
//     );
//   }
// }
