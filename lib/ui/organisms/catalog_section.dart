import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../atoms/section_title.dart';
import 'product_card.dart';

class CatalogSection extends StatelessWidget {
  const CatalogSection({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onDelete,
  });

  final List<Product> products;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Catalog'),
        const SizedBox(height: 8),
        Column(
          children: products
              .map(
                (product) => ProductCard(
                  product: product,
                  onAddToCart: () => onAddToCart(product),
                  onDelete: () => onDelete(product),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
