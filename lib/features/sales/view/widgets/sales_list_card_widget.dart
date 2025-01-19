import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/features/sales/model/sales_model.dart';

class SalesListCard extends StatelessWidget {
  const SalesListCard({
    super.key,
    required this.current,
    required this.status,
    required this.statusStyle,
  });

  final SalesModel current;
  final String status;
  final TextStyle statusStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        current.voucherNo,
        style: AppTypography.cardTitle,
      ),
      subtitle: Text(
        current.customerName,
        style: AppTypography.cardSubTitle.copyWith(fontWeight: FontWeight.w600),
      ),
      trailing: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            Text(
              status,
              style: statusStyle,
            ),
            Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "SAR .",
                  style: AppTypography.cardSubTitle.copyWith(fontSize: 11),
                ),
                Text(
                  current.grandTotal.toString(),
                  style: AppTypography.body1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
