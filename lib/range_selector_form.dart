import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final IntValueSetter minimumValueSetter;
  final IntValueSetter maximumValueSetter;

  const RangeSelectorForm({
    super.key,
    required this.formKey,
    required this.minimumValueSetter,
    required this.maximumValueSetter,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              label: 'Minimum',
              intValueSetter: minimumValueSetter,
            ),
            SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              label: 'Maximum',
              intValueSetter: maximumValueSetter,
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
