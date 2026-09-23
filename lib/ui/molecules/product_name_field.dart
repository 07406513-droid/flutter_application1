import 'package:flutter/material.dart';

import '../atoms/catalog_text_form_field.dart';

class ProductNameField extends StatelessWidget {
  const ProductNameField({
    super.key,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return CatalogTextFormField(
      controller: controller,
      labelText: 'Product Name',
      validator: validator,
    );
  }
}
