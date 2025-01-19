import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';

class FilterStatusSelectButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterStatusSelectButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingSmall),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.selectedColor
              : AppColors.containerFilledColler,
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        ),
        child: Text(
          title,
          style: AppTypography.body1,
        ),
      ),
    );
  }
}
