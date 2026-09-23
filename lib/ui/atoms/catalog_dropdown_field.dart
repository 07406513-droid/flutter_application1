import 'package:flutter/material.dart';

class CatalogDropdownField extends StatelessWidget {
  const CatalogDropdownField({
    super.key,
    required this.initialValue,
    required this.labelText,
    required this.items,
    required this.onChanged,
  });

  final String initialValue;
  final String labelText;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: labelText),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
