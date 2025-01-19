import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';

class CustomSearchField extends StatelessWidget {
  final Function(String) onChanged;
  const CustomSearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChanged(value);
      },
      style: AppTypography.body1,
      decoration: InputDecoration(
          fillColor: AppColors.textFieldFilledColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
          hintText: "Search...",
          hintStyle: AppTypography.cardSubTitle,
          prefixIcon: Icon(Icons.search)),
    );
  }
}
