import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_logo.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/icons.dart';
import 'package:vikn_test/features/home/view/widgets/dash_board_top_view_widget.dart';
import 'package:vikn_test/features/home/view/widgets/dashboard_card_nav_tile.dart';
import 'package:vikn_test/features/profile/view_model/profile_view_model.dart';
import 'package:vikn_test/features/sales/view/sales_view.dart';
import 'package:vikn_test/main.dart';
import 'package:vikn_test/shared/widgets/custom_image_view.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _appBar(),
      body: _body(),
    );
  }

/*body */
  SafeArea _body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              DashboardTopCardView(),
              DashboardNavTile(
                  onTap: () {},
                  leadingIcon: AppIcons.dashBoardBookingIcon,
                  leadingColor: AppColors.dashboardBookingColor,
                  title: "Bookings",
                  subtitle: "123",
                  bottomSubTitle: "Reserved"),
              DashboardNavTile(
                  onTap: () {
                    navigatorKey.currentState!.push(CupertinoPageRoute(
                      builder: (context) => SalesView(),
                    ));
                  },
                  leadingIcon: AppIcons.dashboardInvoiceIcon,
                  leadingColor: AppColors.dashboardInvoiceColor,
                  title: "Invoices",
                  subtitle: "10,232.00",
                  bottomSubTitle: "Rupees"),
            ],
          ),
        ),
      ),
    );
  }

/*App bar */
  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      leading: Image.asset(
        AppLogo.dashLogo,
        height: 20,
        width: 20,
      ),
      leadingWidth: 50,
      title: Badge(
        backgroundColor: AppColors.primaryColor,
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.only(right: AppDimensions.paddingSmall - 3),
          child: Text(
            "CabZing",
            style: AppTypography.heading1,
          ),
        ),
      ),
      actions: [
        Consumer(builder: (context, ref, child) {
          final user = ref.watch(userProvider);
          String image = user.value == null
              ? AppIcons.personIcon
              : user.value!.customerData.photo;
          return Badge(
            alignment: Alignment.topRight,
            offset: Offset(-5, -5),
            smallSize: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.cardColor, shape: BoxShape.circle),
              padding: EdgeInsets.all(AppDimensions.paddingSmall),
              child: ImageView(
                imageSource: image,
                imageHeight: 25,
                imageWidth: 25,
              ),
            ),
          );
        }),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
