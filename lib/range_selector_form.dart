import 'package:flutter/material.dart';
import 'package:flutter_foundations/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const RangeSelectorForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Since we are not dependent on
    // the state to rebuild the Widgets
    // therefore I have not added
    // ref.watch(randomizerProvider)
    // where randomizerProvider is the state.

    // randomizerProvider.notifier points
    // to the set of actions / methods
    // the can be called to modify the
    // state
    final randomizer = ref.read(randomizerProvider.notifier);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              label: 'Minimum',
              intValueSetter: (value) => randomizer.setMin(value),
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              label: 'Maximum',
              intValueSetter: (value) => randomizer.setMax(value),
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
