/*select filter status */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/features/sales/view/widgets/filter_status_select_button.dart';
import 'package:vikn_test/features/sales/view_model/filter_providers.dart';

class StatusFilterRow extends ConsumerWidget {
  const StatusFilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(filterStatusSelectedProvider);
    final selectNotifier = ref.read(filterStatusSelectedProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterStatusSelectButton(
          title: "Pending",
          onTap: () {
            selectNotifier.state = selectedFilter == "Pending" ? "" : "Pending";
          },
          isSelected: selectedFilter == "Pending",
        ),
        FilterStatusSelectButton(
          title: "Invoiced",
          onTap: () {
            selectNotifier.state =
                selectedFilter == "Invoiced" ? "" : "Invoiced";
          },
          isSelected: selectedFilter == "Invoiced",
        ),
        FilterStatusSelectButton(
          title: "Cancelled",
          onTap: () {
            selectNotifier.state =
                selectedFilter == "Cancelled" ? "" : "Cancelled";
          },
          isSelected: selectedFilter == "Cancelled",
        ),
      ],
    );
  }
}
