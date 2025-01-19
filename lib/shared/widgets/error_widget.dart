import 'package:flutter/material.dart';

import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';

import 'package:vikn_test/shared/widgets/custom_button.dart';

class ErrorViewWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRefreshPressed;

  const ErrorViewWidget({
    super.key,
    required this.errorMessage,
    required this.onRefreshPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingLarge,
            vertical: AppDimensions.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.logoutColor,
              size: 50.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: AppTypography.logout,
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              width: size.width * .25,
              height: 40,
              buttonColor: AppColors.containerFilledColler,
              onPressed: () {
                onRefreshPressed();
              },
              childWidget: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
