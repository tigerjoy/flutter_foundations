import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int min, max;

  const RandomizerPage({
    super.key,
    required this.min,
    required this.max,
  });

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final random = Random();

  // To access the properties from the
  // Page class, use the widget instance
  // variable
  void generateRandomNumber() {
    setState(() {
      _generatedNumber =
          random.nextInt(widget.max + 1 - widget.min) + widget.min;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              _generatedNumber?.toString() ?? "Generate a number",
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
