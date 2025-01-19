import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';

import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/features/sales/model/sales_model.dart';
import 'package:vikn_test/features/sales/view/filter_view.dart';
import 'package:vikn_test/features/sales/view/widgets/custome_search_field.dart';
import 'package:vikn_test/features/sales/view/widgets/sales_list_card_widget.dart';
import 'package:vikn_test/features/sales/view_model/filter_providers.dart';
import 'package:vikn_test/features/sales/view_model/sales_view_model.dart';
import 'package:vikn_test/main.dart';

import 'package:vikn_test/shared/widgets/custom_button.dart';
import 'package:vikn_test/shared/widgets/error_widget.dart';
import 'package:vikn_test/shared/widgets/loading_widget.dart';
import 'package:vikn_test/shared/widgets/no_data_widget.dart';

class SalesView extends ConsumerStatefulWidget {
  const SalesView({super.key});

  @override
  ConsumerState<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends ConsumerState<SalesView> {
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    final notifier = ref.read(salesDataProvider.notifier);
    final state = ref.watch(salesDataProvider);
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (state.isLoading) return;
      notifier.loadMoreSales();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final salesState = ref.watch(salesDataProvider);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ref.read(toDateProvider.notifier).state = DateTime.now();
        ref.read(fromDateProvider.notifier).state = DateTime.now();
        ref.read(filterStatusSelectedProvider.notifier).state = "";
        ref.read(customerListFilterNotifierProvider.notifier).clear();
        ref.read(salesDataProvider.notifier).sales = [];
      },
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: _appBar(ref),
          body: _body(salesState, size)),
    );
  }

/*Body */
  Widget? _body(AsyncValue<List<SalesModel>> salesState, Size size) {
    return salesState.when(
      data: (sales) => sales.isEmpty
          ? NoDataWidget()
          : ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index == sales.length) {
                  if (ref.watch(salesDataProvider.notifier).isLoading) {
                    return Center(
                        child: LoadingWidget(
                      loadingMessage: "Loading sales ...",
                    ));
                  } else {
                    return SizedBox.shrink();
                  }
                }
                SalesModel current = sales[index];
                String status = "";
                TextStyle statusStyle = AppTypography.statusText;

                switch (current.status) {
                  case "Invoiced":
                    status = "Invoiced";
                    statusStyle = AppTypography.statusText
                        .copyWith(color: AppColors.buttonColor2);
                    break;
                  case "Pending":
                    status = "Pending";
                    statusStyle = AppTypography.statusText
                        .copyWith(color: AppColors.logoutColor);
                    break;
                  case "Cancelled":
                    status = "Cancelled";
                    statusStyle = AppTypography.statusText
                        .copyWith(color: AppColors.fadeTextColor);
                    break;
                  default:
                    status = "Pending";
                }
                return SalesListCard(
                    current: current, status: status, statusStyle: statusStyle);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: .2,
                  indent: size.width * .2,
                  endIndent: size.width * .2,
                  color: AppColors.dividerColor.withAlpha((.7 * 255).toInt()),
                );
              },
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall),
              itemCount: sales.length + 1),
      loading: () => LoadingWidget(
        loadingMessage: "Loading sales ...",
      ),
      error: (error, stackTrace) => ErrorViewWidget(
        errorMessage: "Failed to load Sales ",
        onRefreshPressed: () {
          ref.read(salesDataProvider.notifier).reloadSalesData();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}

/*AppBar */
AppBar _appBar(WidgetRef ref) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.iconColor),
    backgroundColor: AppColors.appBarColor,
    title: Text(
      "Invoices",
      style: AppTypography.appBarTitle,
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Column(
        spacing: 12,
        children: [
          Divider(
            color: AppColors.dividerColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomSearchField(
                    onChanged: (value) {
                      ref.read(salesDataProvider.notifier).filterSales(value);
                    },
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: CustomButton(
                        borderRadius: AppDimensions.textFiedlBorderRadius - 5,
                        height: 48,
                        buttonColor: AppColors.containerFilledColler,
                        onPressed: () async {
                          navigatorKey.currentState!.push(CupertinoPageRoute(
                            builder: (context) => SalesFilter(),
                          ));
                        },
                        childWidget: Row(
                          spacing: 3,
                          children: [
                            Icon(
                              size: 25,
                              fill: 1.0,
                              Icons.filter_list_sharp,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              "Add Filters",
                              style: AppTypography.body1
                                  .copyWith(fontWeight: FontWeight.w600),
                            )
                          ],
                        )))
              ],
            ),
          ),
          Divider(
            color: AppColors.dividerColor,
          ),
        ],
      ),
    ),
  );
}
