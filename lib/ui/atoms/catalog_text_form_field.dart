import 'package:flutter/material.dart';

class CatalogTextFormField extends StatelessWidget {
  const CatalogTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool alignLabelWithHint;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: alignLabelWithHint,
      ),
      validator: validator,
    );
  }
}
