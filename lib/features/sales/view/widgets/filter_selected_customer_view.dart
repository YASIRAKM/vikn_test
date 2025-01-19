import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';

import 'package:vikn_test/core/extensions/string_extension.dart';
import 'package:vikn_test/features/sales/view_model/filter_providers.dart';

class SelectedCustomerMethod extends ConsumerWidget {
  const SelectedCustomerMethod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedState = ref.watch(customerListFilterNotifierProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: selectedState.map((customer) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingSmall),
            decoration: BoxDecoration(
                color: AppColors.containerFilledColler,
                borderRadius:
                    BorderRadius.circular(AppDimensions.textFiedlBorderRadius)),
            child: Row(
              spacing: 6,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  customer.capitalizeFirst,
                  style: AppTypography.cardTitle,
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(customerListFilterNotifierProvider.notifier)
                        .removeCustomer(customer);
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.dividerColor,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
