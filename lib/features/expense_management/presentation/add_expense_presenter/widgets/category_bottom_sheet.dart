import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';

class CategoryBottomSheet extends StatelessWidget {
  final List<CategoryEntity> categories;
  final Function(CategoryEntity) onCategorySelected;

  const CategoryBottomSheet({
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              onCategorySelected(category);
              Navigator.of(context).pop(); // Close the bottom sheet
            },
            child: Icon(
              category.icon,
              size: 48,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
