import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';

// Flutter Hooks are useful when using
// AnimationController since we can
// auto dispose the controllers
// through hooks

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({super.key});

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
      body: RangeSelectorForm(formKey: formKey),
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

            // For using locally scoped providers
            // final notifier = context
            //     .read<RandomizerChangeNotifier>(); // ✅ capture here

            // Navigate to the generator
            // page
            Navigator.of(context).push(
              MaterialPageRoute(
                // Since all the state is
                // contained in the
                // RandomizerChangeNotifier
                // we need not pass the min
                //and max anymore
                builder: (context) => const RandomizerPage(),

                // For using locally scoped Providers
                // builder: (context) => ChangeNotifierProvider.value(
                //   value: notifier,
                //   child: const RandomizerPage(),
                // ),
              ),
            );
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
