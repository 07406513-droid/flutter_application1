import 'package:flutter/material.dart';

import '../atoms/catalog_text_form_field.dart';

class ProductPriceField extends StatelessWidget {
  const ProductPriceField({
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
      labelText: 'Price',
      keyboardType: TextInputType.number,
      validator: validator,
    );
  }
}
