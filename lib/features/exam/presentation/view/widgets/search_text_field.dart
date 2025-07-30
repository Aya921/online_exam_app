import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hint: Text(
          'Search',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.gray),
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.gray),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
      ),
    );
  }
}
