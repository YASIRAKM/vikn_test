import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';

class NoDataWidget extends StatelessWidget {
  final String? message;
  final double? iconSize;
  final Color? iconColor;

  const NoDataWidget({
    super.key,
    this.message = "No data available",
    this.iconSize = 50.0,
    this.iconColor = AppColors.containerFilledColler,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.account_box_rounded,
            size: iconSize,
            color: iconColor,
          ),
          const SizedBox(height: 10.0),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: AppTypography.cardSubTitle,
          ),
        ],
      ),
    );
  }
}
