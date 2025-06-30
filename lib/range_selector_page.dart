import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Flutter Hooks are useful when using
// AnimationController since we can
// auto dispose the controllers
// through hooks

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // When the order in which the hooks
    // are declared changes, use Hot Restart
    // instead of Hot Reload

    // State hook
    final min = useState<int>(0);
    final max = useState<int>(0);

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
        minimumValueSetter: (value) => min.value = value,
        maximumValueSetter: (value) => max.value = value,
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
              builder: (context) =>
                  RandomizerPage(min: min.value, max: max.value),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
