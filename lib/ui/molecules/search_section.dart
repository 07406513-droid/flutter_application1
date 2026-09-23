import 'package:flutter/material.dart';

import '../atoms/catalog_text_field.dart';
import '../atoms/section_title.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.onQueryChanged,
  });

  final ValueChanged<String> onQueryChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Search Products'),
        const SizedBox(height: 8),
        CatalogTextField(
          hintText: 'Type a product name...',
          onChanged: onQueryChanged,
        ),
      ],
    );
  }
}
