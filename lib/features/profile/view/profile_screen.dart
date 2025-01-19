import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/icons.dart';
import 'package:vikn_test/features/profile/model/user_model.dart';
import 'package:vikn_test/features/profile/view/widget/profile_list_tile.dart';
import 'package:vikn_test/features/profile/view/widget/profile_top_view_widget.dart';
import 'package:vikn_test/features/profile/view_model/profile_view_model.dart';
import 'package:vikn_test/shared/widgets/error_widget.dart';
import 'package:vikn_test/shared/widgets/loading_widget.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetailsAssyncValue = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _body(userDetailsAssyncValue, ref, context),
    );
  }

/*body */
  SafeArea _body(AsyncValue<UserModel> userDetailsAssyncValue, WidgetRef ref,
      BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingLarge),
        child: userDetailsAssyncValue.when(
            error: (error, stackTrace) {
              return Center(
                child: ErrorViewWidget(
                  errorMessage: error.toString(),
                  onRefreshPressed: () async {
                    ref.read(userProvider.notifier).fetchUser();
                  },
                ),
              );
            },
            loading: () => Center(
                  child: LoadingWidget(
                    loadingMessage: "Profile loading ...",
                  ),
                ),
            data: (data) => SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfilePageTopWidget(user: data, ref: ref),
                      ProfileListTile(
                          onTap: () {},
                          icon: AppIcons.profileHelpIcon,
                          title: "Help"),
                      ProfileListTile(
                          icon: AppIcons.profileFaqIcon,
                          onTap: () {},
                          title: "FAQ"),
                      ProfileListTile(
                          icon: AppIcons.profileInviteFriendIcon,
                          onTap: () {},
                          title: "Invite Friends"),
                      ProfileListTile(
                          icon: AppIcons.profileTermsIcon,
                          onTap: () {},
                          title: "Terms of service"),
                      ProfileListTile(
                          icon: AppIcons.profilePrivacyIcon,
                          onTap: () {},
                          title: "Privacy Policy"),
                    ],
                  ),
                )),
      ),
    );
  }

// /*top VIEW */
//   Card _topCardView(
//       {required BuildContext context,
//       required UserModel user,
//       required WidgetRef ref}) {
//     return
//   }
}
