import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RangeSelectorForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    // Since we are not dependent on widget
    // rebuild whenever any state variable
    // change, therefore using context.read<>()
    // call is fine.

    // If we wanted to the widget to be rebuilt
    // whenever notifyListeners() is called
    // then the widget needs to be enclosed within
    // a Consumer<RandomizerChangeNotifier>
    final randomizerChangeNotifier = context.read<RandomizerChangeNotifier>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              label: 'Minimum',
              intValueSetter: (value) => randomizerChangeNotifier.min = value,
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              label: 'Maximum',
              intValueSetter: (value) => randomizerChangeNotifier.max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  final String label;
  final IntValueSetter intValueSetter;

  const RangeSelectorTextFormField({
    required this.label,
    required this.intValueSetter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      // This method is called, when the
      // form is being saved
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '0')),
      validator: (value) {
        // When everything is correct
        // return null;

        // When there is an error
        // return "Error";
        // This will be displayed in red
        // beneath the TextField

        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        }

        return null;
      },
    );
  }
}
