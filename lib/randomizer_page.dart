import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  final random = Random();

  RandomizerPage({
    super.key,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    // The value of the generatedNumber
    // does not change every time the
    // build method runs
    final generatedNumber = useState<int?>(null);

    // Using Flutter Hooks, we don't need
    // to enclose the value change in a
    // setState(), changing the value
    // results in a re-render
    void generateRandomNumber() {
      generatedNumber.value = random.nextInt(max + 1 - min) + min;
    }

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
              generatedNumber.value?.toString() ?? "Generate a number",
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
        onPressed: generateRandomNumber,
        label: Text("Generate"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
