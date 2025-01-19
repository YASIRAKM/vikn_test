import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_typography.dart';

import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/lists.dart';
import 'package:vikn_test/features/home/view/dash_board.dart';
import 'package:vikn_test/features/home/view/widgets/dot_indicator.dart';
import 'package:vikn_test/features/profile/view/profile_screen.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';
import 'package:vikn_test/features/home/view_model/index_view_model.dart';

// ignore: must_be_immutable
class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(bottomNavigationIndexProvider);

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: selectedIndex == 0
            ? DashBoardScreen()
            : selectedIndex == 3
                ? ProfileView()
                : Center(
                    child: Text(
                    "Navigate from invoice to view sales.",
                    style: AppTypography.dialogSubTitle,
                  )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (value) {
            ref.read(bottomNavigationIndexProvider.notifier).state = value;
          },
          items: bottomNavItems.map(
            (e) {
              return BottomNavigationBarItem(
                icon: Column(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconView(
                      height: 20,
                      width: 20,
                      color: bottomNavItems.indexOf(e) == selectedIndex
                          ? Colors.white
                          : Colors.grey,
                      icon: e.values.first,
                    ),
                    DotIndicator(
                        selectedIndex: selectedIndex,
                        index: bottomNavItems.indexOf(e)),
                  ],
                ),
                label: e.keys.first,
              );
            },
          ).toList(),
        ));
  }
}
