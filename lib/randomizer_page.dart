import 'package:flutter/material.dart';
import 'package:flutter_foundations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // randomizerProvider points to the state

    // randomizerProvider.notifier points
    // to the set of actions / methods
    // the can be called to modify the
    // state
    final randomizer = ref.watch(randomizerProvider);
    final generatedNumber = randomizer.generatedNumber;

    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Spacer(),
          Center(
            child: Text(
              generatedNumber?.toString() ?? "Generate a number",
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),
          ),
          // Spacer(),
          // ElevatedButton(
          //   onPressed: generateRandomNumber,
          //   child: Text("Generate"),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ref.read(randomizerProvider.notifier).generateRandomNumber,
        label: Text("Generate"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Using Riverpod Consumer within a Stateless
// widget

// class RandomizerPage extends StatelessWidget {
//   const RandomizerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Randomizer'),
//         backgroundColor: Theme.of(context).colorScheme.primary,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           // Spacer(),
//           // When notifyListeners() is called
//           // then the builder( ) of the Consumer
//           // runs.

//           // Using just context.read<>() would
//           // not re-run when the notifyListeners()
//           // is called.
//           Center(
//             child: Consumer(
//               builder: (context, ref, _) {
//                 // You can access a provider as long
//                 // you can import it. That is how
//                 // the locally scoped providers are
//                 // created.
//                 final randomizer = ref.watch(randomizerProvider);

//                 final generatedNumber = randomizer.generatedNumber;

//                 return Text(
//                   generatedNumber?.toString() ?? "Generate a number",
//                   style: TextStyle(
//                     fontSize: 32.0,
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Spacer(),
//           // ElevatedButton(
//           //   onPressed: generateRandomNumber,
//           //   child: Text("Generate"),
//           // ),
//         ],
//       ),
//       floatingActionButton: Consumer(
//         builder: (context, ref, _) {
//           // Does not re-render the widget
//           // whenever the provider updates
//           final randomizer = ref.read(randomizerProvider);

//           return FloatingActionButton.extended(
//             onPressed: randomizer.generateRandomNumber,
//             label: Text("Generate"),
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
