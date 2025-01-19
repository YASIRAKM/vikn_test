
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/icons.dart';
import 'package:vikn_test/core/utils/confirm_dialoge.dart';
import 'package:vikn_test/core/utils/show_message.dart';
import 'package:vikn_test/features/auth/view/login_screan.dart';
import 'package:vikn_test/features/auth/view_model/auth_view_model.dart';
import 'package:vikn_test/features/profile/model/user_model.dart';
import 'package:vikn_test/features/profile/view/widget/top_card_widget.dart';
import 'package:vikn_test/main.dart';
import 'package:vikn_test/shared/widgets/custom_button.dart';
import 'package:vikn_test/shared/widgets/custom_image_view.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';

class ProfilePageTopWidget extends StatelessWidget {
  final UserModel user;
  final WidgetRef ref;

  const ProfilePageTopWidget(
      {super.key, required this.user, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.marginMedium,
            vertical: AppDimensions.marginSmall),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 12,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(
                          AppDimensions.cardBorderRadius - 5)),
                  padding: EdgeInsets.all(AppDimensions.paddingSmall),
                  child: ImageView(
                    imageSource: user.customerData.photo,
                    imageHeight: 30,
                    imageWidth: 30,
                  ),
                ),
                Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.data.firstName} ${user.data.lastName}",
                      style: AppTypography.body1.copyWith(fontSize: 16),
                    ),
                    Text(
                      user.data.email,
                      style: AppTypography.profileSubHeading,
                    )
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: IconView(
                      icon: AppIcons.editIcon,
                      color: AppColors.iconColor,
                    ))
              ],
            ),
            Row(
              spacing: 24,
              children: [
                Expanded(
                  child: TopCardWidget(
                      leadingColor: AppColors.profileRidesColor,
                      leadingIcon: AppIcons.threeStarIcon,
                      title: "4.3",
                      subtitle: "2,211",
                      bottomSubTitle: "rides"),
                ),
                Expanded(
                  child: TopCardWidget(
                      leadingColor: AppColors.profileKycVerifiedColor,
                      leadingIcon: AppIcons.verifiedIcon,
                      title: "KYC",
                      subtitle: "Verified",
                      bottomSubTitle: ""),
                )
              ],
            ),
            CustomButton(
              onPressed: () async {
                confirmDialoge(
                    context: context,
                    title: "Logout",
                    content: "Do you want to logout?",
                    onPressed: () async {
                      bool res = await ref.read(authProvider.notifier).logout();
                      if (res) {
                        navigatorKey.currentState!.pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        showMessage(message: "Failed to log out");
                      }
                    },
                    buttonText: "Logout");
              },
              childWidget: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconView(
                    height: 20,
                    width: 20,
                    icon: AppIcons.logoutIcon,
                    color: AppColors.logoutColor,
                  ),
                  Text(
                    "Logout",
                    style: AppTypography.logout,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
