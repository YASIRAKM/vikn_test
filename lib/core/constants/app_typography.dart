import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/colors.dart';

class AppTypography {
  static const appBarTitle = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
  static const cardTitle = TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
    decoration: TextDecoration.none,
  );
  static const textFieldStyle = TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
  );
  static const cardSubTitle =
      TextStyle(color: AppColors.fadeTextColor, fontSize: 12);

  static const body1 = TextStyle(
    fontSize: 12,
    color: AppColors.textColor,
    decoration: TextDecoration.none,
  );
  static const body2 = TextStyle(
    fontSize: 10,
    color: AppColors.textColor,
    decoration: TextDecoration.none,
  );

  static const heading1 = TextStyle(
      fontSize: 17, color: AppColors.textColor, fontWeight: FontWeight.bold);
  static const profileSubHeading = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: AppColors.linkTextColor);
  static const logout = TextStyle(
      color: AppColors.logoutColor, fontSize: 12, fontWeight: FontWeight.w600);

  static const statusText = TextStyle(
    color: AppColors.greenTextColor,
    fontSize: 10,
  );

  static const dialogeTitle = TextStyle(
      color: AppColors.textColor, fontSize: 18, fontWeight: FontWeight.bold);
  static const dialogSubTitle = TextStyle(
      color: AppColors.fadeTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w300);
}
