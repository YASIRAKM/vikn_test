import 'package:flutter/material.dart';

import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';

void transparentDialog(BuildContext context,
    {bool barrierDismissible = false}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Center(
        child: Container(
          width: 140,
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingLarge,
              vertical: AppDimensions.paddingMedium),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.linkTextColor,
              ),
              const Text(
                'Loading...',
                style: AppTypography.body1,
              ),
            ],
          ),
        ),
      );
    },
  );
}
