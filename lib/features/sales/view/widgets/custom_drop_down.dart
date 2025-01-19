import 'package:flutter/material.dart';

import 'package:vikn_test/core/constants/colors.dart';

// ignore: must_be_immutable
class CustomFilledDropDown extends StatelessWidget {
  bool isFilled;
  final List<DropdownMenuItem> items;

  final String hintText;
  final Function(dynamic) onChanged;
  CustomFilledDropDown(
      {super.key,
      required this.items,
      this.isFilled = false,
      required this.hintText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        hintText,
        style: TextStyle(color: AppColors.textColor),
      ),
      isDense: true,
      dropdownColor: AppColors.backgroundColor,
      style: TextStyle(color: AppColors.textColor),
      borderRadius: BorderRadius.circular(20),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        filled: isFilled,
        fillColor: AppColors.textFieldFilledColor,
        enabled: true,
        border: OutlineInputBorder(
          borderSide: isFilled
              ? BorderSide.none
              : BorderSide(color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(isFilled ? 30 : 10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: isFilled
              ? BorderSide.none
              : BorderSide(color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(isFilled ? 30 : 10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: isFilled
              ? BorderSide.none
              : BorderSide(color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(isFilled ? 30 : 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: isFilled
              ? BorderSide.none
              : BorderSide(color: AppColors.textFieldBorderColor, width: 1),
          borderRadius: BorderRadius.circular(isFilled ? 30 : 10),
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
