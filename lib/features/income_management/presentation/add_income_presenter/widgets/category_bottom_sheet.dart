import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the package
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
    // Initialize screenutil
    ScreenUtil.init(
      context,
    );

    return Container(
      height: 0.4.sh, // Use screenutil to adapt to screen height
      padding: EdgeInsets.all(16.w), // Use screenutil for padding
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16.w, // Use screenutil for spacing
          mainAxisSpacing: 16.h, // Use screenutil for spacing
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
              size: 48.sp, // Use screenutil for icon size
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
