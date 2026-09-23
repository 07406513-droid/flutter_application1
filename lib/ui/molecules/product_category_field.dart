import 'package:flutter/material.dart';

import '../atoms/catalog_dropdown_field.dart';

class ProductCategoryField extends StatelessWidget {
  const ProductCategoryField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return CatalogDropdownField(
      initialValue: value,
      labelText: 'Category',
      items: items,
      onChanged: onChanged,
    );
  }
}
