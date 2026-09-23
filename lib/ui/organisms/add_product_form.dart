import 'package:flutter/material.dart';

import '../../models/product_form_data.dart';
import '../atoms/submit_button.dart';
import '../atoms/section_title.dart';
import '../molecules/product_category_field.dart';
import '../molecules/product_description_field.dart';
import '../molecules/product_name_field.dart';
import '../molecules/product_price_field.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    super.key,
    required this.onSubmit,
  });

  final ValueChanged<ProductFormData> onSubmit;

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  static const List<String> _categories = [
    'Electronics',
    'Home',
    'Office',
    'Accessories',
  ];

  String _selectedCategory = 'Electronics';

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product name is required';
    }
    return null;
  }

  String? _validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }

    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Price must be a number';
    }

    if (parsed <= 0) {
      return 'Price must be greater than zero';
    }

    return null;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final formData = ProductFormData(
      name: _nameController.text,
      price: double.parse(_priceController.text),
      category: _selectedCategory,
      description: _descriptionController.text,
    );

    widget.onSubmit(formData);

    setState(() {
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _selectedCategory = 'Electronics';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Add New Product'),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductNameField(
                controller: _nameController,
                validator: _validateName,
              ),
              const SizedBox(height: 12),
              ProductPriceField(
                controller: _priceController,
                validator: _validatePrice,
              ),
              const SizedBox(height: 12),
              ProductCategoryField(
                value: _selectedCategory,
                items: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value ?? 'Electronics';
                  });
                },
              ),
              const SizedBox(height: 12),
              ProductDescriptionField(
                controller: _descriptionController,
              ),
              const SizedBox(height: 16),
              SubmitButton(onPressed: _submit),
            ],
          ),
        ),
      ],
    );
  }
}
