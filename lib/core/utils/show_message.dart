import 'package:flutter/material.dart';

import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/main.dart';

showMessage({required String message}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.info_outline,
          color: AppColors.iconColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: AppTypography.body1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: AppColors.backgroundColor.withRed(20),
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(AppDimensions.textFiedlBorderRadius * 2),
    ),
    padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingMedium,
        horizontal: AppDimensions.paddingLarge),
  );

  return scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
