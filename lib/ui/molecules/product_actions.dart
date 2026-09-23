import 'package:flutter/material.dart';

import '../atoms/delete_button.dart';
import '../atoms/primary_button.dart';

class ProductActions extends StatelessWidget {
  const ProductActions({
    super.key,
    required this.onAddToCart,
    required this.onDelete,
  });

  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          label: 'Add to Cart',
          onPressed: onAddToCart,
        ),
        const SizedBox(height: 6),
        DeleteButton(onPressed: onDelete),
      ],
    );
  }
}
