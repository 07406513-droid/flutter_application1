import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../models/product_form_data.dart';
import '../molecules/search_section.dart';
import '../organisms/add_product_form.dart';
import '../organisms/catalog_app_bar.dart';
import '../organisms/catalog_section.dart';
import '../templates/catalog_template.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Product> _products = [
    const Product(
      id: 1,
      name: 'Wireless Mouse',
      price: 599.0,
      category: 'Electronics',
      icon: Icons.mouse,
    ),
    const Product(
      id: 2,
      name: 'Mechanical Keyboard',
      price: 2499.0,
      category: 'Electronics',
      icon: Icons.keyboard,
    ),
    const Product(
      id: 3,
      name: 'Ceramic Mug',
      price: 149.0,
      category: 'Home',
      icon: Icons.coffee,
    ),
    const Product(
      id: 4,
      name: 'Notebook',
      price: 79.0,
      category: 'Office',
      icon: Icons.book,
    ),
    const Product(
      id: 5,
      name: 'Desk Lamp',
      price: 899.0,
      category: 'Home',
      icon: Icons.lightbulb,
    ),
    const Product(
      id: 6,
      name: 'Backpack',
      price: 1299.0,
      category: 'Accessories',
      icon: Icons.backpack,
    ),
    const Product(
      id: 7,
      name: 'Water Bottle',
      price: 299.0,
      category: 'Accessories',
      icon: Icons.local_drink,
    ),
  ];

  String _searchQuery = '';
  int _nextId = 8;

  List<Product> get _filteredProducts {
    return _products.where((product) {
      return product.name
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void _handleSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  void _handleAddToCart(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${product.name} to cart'),
      ),
    );
  }

  void _handleDelete(Product product) {
    setState(() {
      _products.removeWhere((item) => item.id == product.id);
    });
  }

  void _handleAddProduct(ProductFormData formData) {
    final newProduct = Product(
      id: _nextId,
      name: formData.name,
      price: formData.price,
      category: formData.category,
      icon: Icons.inventory_2,
      description: formData.description,
    );

    setState(() {
      _products.add(newProduct);
      _nextId = _nextId + 1;
      _searchQuery = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newProduct.name} added to catalog!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CatalogTemplate(
      appBar: const CatalogAppBar(),
      searchSection: SearchSection(
        onQueryChanged: _handleSearchChanged,
      ),
      catalogSection: CatalogSection(
        products: _filteredProducts,
        onAddToCart: _handleAddToCart,
        onDelete: _handleDelete,
      ),
      addProductSection: AddProductForm(
        onSubmit: _handleAddProduct,
      ),
    );
  }
}
