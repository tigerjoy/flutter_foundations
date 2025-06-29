import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();

  // We need class fields where we can store
  // the values of the input TextFields
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    // Provides an AppBar, Body etc
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Form widget will be useful, it tells
      // it's child form fields to validate
      // and also save the data

      // Form widget orchestrates the saving
      // and validation of the Form Fields
      body: RangeSelectorForm(
        formKey: formKey,
        minimumValueSetter: (value) => _min = value,
        maximumValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        // We need to get hold of the Form widget
        // defined above. We do so using the
        // GlobalKey. This will also give us the
        // form state
        onPressed: () {
          // Validate the form
          bool isFormValid = formKey.currentState?.validate() ?? false;

          if (isFormValid) {
            // Calling the save() method, runs the
            // onSaved callback of all the
            // form fields
            formKey.currentState?.save();
          }

          // Navigate to the generator
          // page
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RandomizerPage(min: _min, max: _max),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
