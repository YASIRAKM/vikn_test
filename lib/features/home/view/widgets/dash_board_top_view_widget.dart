import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/lists.dart';
import 'package:vikn_test/core/extensions/date_extension.dart';
import 'package:vikn_test/features/home/view/widgets/chart_widget.dart';
import 'package:vikn_test/features/home/view_model/index_view_model.dart';

class DashboardTopCardView extends StatelessWidget {
  const DashboardTopCardView({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
      ),
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          spacing: 2,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  children: [
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "SAR",
                          style:
                              AppTypography.cardSubTitle.copyWith(fontSize: 14),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "2,78,00000.00",
                          style: AppTypography.body1.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "+21%",
                          style:
                              AppTypography.statusText.copyWith(fontSize: 12),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "than last month . ",
                          style: AppTypography.cardSubTitle,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Revenue",
                  style: AppTypography.appBarTitle,
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 1.75,
              child: ChartWidget(),
            ),
            SizedBox(height: 2),
            Text(
              DateTime.now().monthYear,
              style:
                  AppTypography.cardTitle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 1),
            SizedBox(
              height: 50,
              child: Consumer(
                builder: (context, WidgetRef ref, child) {
                  int selectedIndex = ref.watch(selectedIndexProvider);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: dayList.length,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(AppDimensions.paddingSmall),
                      child: GestureDetector(
                        onTap: () {
                          ref.read(selectedIndexProvider.notifier).state =
                              index;
                        },
                        child: Container(
                          padding: EdgeInsets.all(AppDimensions.paddingSmall),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.cardBorderRadius - 10),
                            color: selectedIndex == index
                                ? AppColors.selectedColor
                                : Colors.transparent,
                          ),
                          child: Text(
                            dayList[index].toString().length == 1
                                ? "0${dayList[index].toString()}"
                                : dayList[index].toString(),
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
