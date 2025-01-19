import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';

class TopCardWidget extends StatelessWidget {
  final Color leadingColor;
  final String leadingIcon;
  final String title;
  final String subtitle;
  final String bottomSubTitle;

  const TopCardWidget({
    super.key,
    required this.leadingColor,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.bottomSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.cardBorderRadiusLarge)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingSmall),
        child: Row(
          children: [
            Container(
              height: 80,
              width: size.width * .1,
              decoration: BoxDecoration(
                color: leadingColor,
                borderRadius:
                    BorderRadius.circular(AppDimensions.cardBorderRadiusLarge),
              ),
              padding: EdgeInsets.all(AppDimensions.paddingSmall),
              child: Center(
                child: IconView(
                  height: 15,
                  width: 15,
                  icon: leadingIcon,
                  color: AppColors.dashboardCardLeadIconColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTypography.cardTitle,
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      title == "KYC"
                          ? Icons.verified_user_outlined
                          : Icons.star,
                      color: AppColors.iconColor,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: title == "KYC"
                        ? AppColors.profileKycVerifiedColor
                        : AppColors.fadeTextColor,
                    fontSize: 12,
                  ),
                ),
                if (bottomSubTitle.isNotEmpty) const SizedBox(height: 2),
                if (bottomSubTitle.isNotEmpty)
                  Text(
                    bottomSubTitle,
                    style: TextStyle(
                      color: AppColors.profileRidesColor,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
