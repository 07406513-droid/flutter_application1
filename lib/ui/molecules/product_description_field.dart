import 'package:flutter/material.dart';

import '../atoms/catalog_text_form_field.dart';

class ProductDescriptionField extends StatelessWidget {
  const ProductDescriptionField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CatalogTextFormField(
      controller: controller,
      labelText: 'Description',
      maxLines: 3,
      alignLabelWithHint: true,
    );
  }
}
