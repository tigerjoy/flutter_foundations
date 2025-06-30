import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Don't do this, since during
    // Navigation, this may be not
    // available immediately, resulting
    // in ProviderNotFoundException

    // final randomizerChangeNotifier = context.read<RandomizerChangeNotifier>();
    // final generatedNumber = randomizerChangeNotifier.generatedNumber;

    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Spacer(),
          // When notifyListeners() is called
          // then the builder( ) of the Consumer
          // runs.

          // Using just context.read<>() would
          // not re-run when the notifyListeners()
          // is called.
          Center(
            child: Consumer<RandomizerChangeNotifier>(
              builder: (context, randomizerChangeNotifier, _) {
                final generatedNumber =
                    randomizerChangeNotifier.generatedNumber;

                return Text(
                  generatedNumber?.toString() ?? "Generate a number",
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                );
              },
            ),
          ),
          // Spacer(),
          // ElevatedButton(
          //   onPressed: generateRandomNumber,
          //   child: Text("Generate"),
          // ),
        ],
      ),
      floatingActionButton: Consumer<RandomizerChangeNotifier>(
        builder: (context, randomizerChangeNotifier, _) {
          return FloatingActionButton.extended(
            onPressed: randomizerChangeNotifier.generateRandomNumber,
            label: Text("Generate"),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
