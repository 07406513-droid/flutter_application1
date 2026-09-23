import 'package:flutter/material.dart';

class CatalogTemplate extends StatelessWidget {
  const CatalogTemplate({
    super.key,
    required this.appBar,
    required this.searchSection,
    required this.catalogSection,
    required this.addProductSection,
  });

  final PreferredSizeWidget appBar;
  final Widget searchSection;
  final Widget catalogSection;
  final Widget addProductSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchSection,
            const SizedBox(height: 16),
            catalogSection,
            const Divider(height: 32, thickness: 1),
            addProductSection,
          ],
        ),
      ),
    );
  }
}
