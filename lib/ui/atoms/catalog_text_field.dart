import 'package:flutter/material.dart';

class CatalogTextField extends StatelessWidget {
  const CatalogTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
