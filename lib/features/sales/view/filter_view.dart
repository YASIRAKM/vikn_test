import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/lists.dart';
import 'package:vikn_test/features/sales/view/widgets/custom_drop_down.dart';
import 'package:vikn_test/features/sales/view/widgets/filter_selected_customer_view.dart';
import 'package:vikn_test/features/sales/view/widgets/select_date_widget.dart';
import 'package:vikn_test/features/sales/view/widgets/select_status_filter_widget.dart';
import 'package:vikn_test/features/sales/view_model/filter_providers.dart';
import 'package:vikn_test/features/sales/view_model/sales_view_model.dart';
import 'package:vikn_test/main.dart';

// ignore: must_be_immutable
class SalesFilter extends ConsumerWidget {
  const SalesFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _appBar(ref),
      body: _body(size, ref),
    );
  }

/*Body */
  Padding _body(
    Size size,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        spacing: 16,
        children: [
          Divider(
            color: AppColors.dividerColor,
          ),
          SizedBox(
            width: size.width * .4,
            height: size.height * .05,
            child: CustomFilledDropDown(
              items: dateFilterItems.map(
                (e) {
                  return DropdownMenuItem(
                      value: e.toString().toLowerCase(),
                      child: Text(e.toString()));
                },
              ).toList(),
              hintText: "This month",
              isFilled: true,
              onChanged: (value) {
                _selectDateFromDropDown(value, ref);
              },
            ),
          ),
          SelectDateWidget(
            isFromToTo: true,
          ),
          Divider(
            color: AppColors.dividerColor,
          ),
          StatusFilterRow(),
          CustomFilledDropDown(
            items: customerList.map(
              (e) {
                return DropdownMenuItem(
                    value: e.toString().toLowerCase(),
                    child: Text(e.toString()));
              },
            ).toList(),
            hintText: "Customer",
            onChanged: (value) {
              ref
                  .read(customerListFilterNotifierProvider.notifier)
                  .addCustomer(value);
            },
          ),
          Divider(
            thickness: .2,
            indent: size.width * .2,
            endIndent: size.width * .2,
            color: AppColors.dividerColor.withAlpha((.7 * 255).toInt()),
          ),
          SelectedCustomerMethod(),
        ],
      ),
    );
  }

/*selecting date range */
  void _selectDateFromDropDown(value, WidgetRef ref) {
    DateTime now = DateTime.now();
    int monthsToSubtract = 0;
    switch (value.toString().toLowerCase()) {
      case "this month":
        ref.read(fromDateProvider.notifier).state =
            DateTime(now.year, now.month, 1);
        ref.read(toDateProvider.notifier).state =
            DateTime(now.year, now.month, now.day);
        break;
      case "3 months":
        monthsToSubtract = 3;
        break;
      case "6 months":
        monthsToSubtract = 6;
        break;
      case "9 months":
        monthsToSubtract = 9;
        break;
      default:
        monthsToSubtract = 0;
    }
    if (monthsToSubtract > 0) {
      ref.read(fromDateProvider.notifier).state =
          DateTime(now.year, now.month - monthsToSubtract, now.day);
      ref.read(toDateProvider.notifier).state =
          DateTime(now.year, now.month, now.day);
    }
  }

/*App bar */
  AppBar _appBar(WidgetRef ref) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.iconColor),
      backgroundColor: AppColors.appBarColor,
      title: Text(
        "Filters",
        style: AppTypography.appBarTitle,
      ),
      actions: [
        SizedBox(
          width: 12,
        ),
        Icon(
          Icons.remove_red_eye_outlined,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () async {
            await ref
                .read(salesDataProvider.notifier)
                .filterSales("")
                .then((_) {
              Future.delayed(Duration(milliseconds: 100), () {
                navigatorKey.currentState!.pop();
              });
            });
          },
          child: Text(
            "Filter",
            style: AppTypography.cardTitle.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: 26,
        ),
      ],
    );
  }
}
