import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';

class ProfileListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;

  const ProfileListTile({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      onTap: onTap,
      leading: IconView(
        icon: icon,
        color: AppColors.profileListIconColor,
      ),
      title: Text(
        title,
        style: AppTypography.cardTitle,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.iconColor,
        size: 12,
      ),
    );
  }
}
