import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';

class DashboardNavTile extends StatelessWidget {
  final VoidCallback onTap;
  final Color leadingColor;
  final String leadingIcon;
  final String title;
  final String subtitle;
  final String bottomSubTitle;

  const DashboardNavTile({
    super.key,
    required this.onTap,
    required this.leadingColor,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.bottomSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                height: 80,
                width: size.width * .1,
                decoration: BoxDecoration(
                  color: leadingColor,
                  borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.circular(AppDimensions.cardBorderRadiusLarge),
                    top: Radius.circular(AppDimensions.cardBorderRadiusLarge),
                  ),
                ),
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
                  Text(
                    title,
                    style: AppTypography.body1.copyWith(
                      color: title.toLowerCase() == "invoices"
                          ? AppColors.dashboardInvoiceColor
                          : null,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTypography.body1,
                  ),
                  Text(
                    bottomSubTitle,
                    style: AppTypography.cardSubTitle,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.cardBorderRadius,
                  ),
                ),
                padding: EdgeInsets.all(AppDimensions.marginMedium),
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
