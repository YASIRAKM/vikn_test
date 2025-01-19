import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/extensions/date_extension.dart';
import 'package:vikn_test/features/sales/view_model/filter_providers.dart';

// ignore: must_be_immutable
class SelectDateWidget extends ConsumerWidget {
  bool isFromToTo;
  SelectDateWidget({super.key, this.isFromToTo = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fromDateProvider);
    ref.watch(toDateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: isFromToTo ? 12 : 0,
      children: [
        isFromToTo
            ? selectDate(context, ref, isFromDate: true)
            : SizedBox(
                height: 0,
                width: 0,
              ),
        selectDate(context, ref),
      ],
    );
  }

  GestureDetector selectDate(BuildContext context, WidgetRef ref,
      {bool isFromDate = false}) {
    DateTime selectedDate =
        ref.watch(isFromDate ? fromDateProvider : toDateProvider);
    return GestureDetector(
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2050));
        if (selectedDate != null) {
          ref
              .read(isFromDate
                  ? fromDateProvider.notifier
                  : toDateProvider.notifier)
              .state = selectedDate;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingSmall),
        decoration: BoxDecoration(
            color: AppColors.containerFilledColler,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          spacing: 8,
          children: [
            Icon(
              Icons.calendar_month,
              color: AppColors.buttonColor2,
              size: 16,
            ),
            Text(
              selectedDate.dateToDDMMYYYY,
              style: AppTypography.body1,
            )
          ],
        ),
      ),
    );
  }
}
