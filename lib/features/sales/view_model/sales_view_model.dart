import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/data/repositories/sales_repository.dart';
import 'package:vikn_test/features/sales/model/sales_model.dart';
import 'package:vikn_test/features/sales/view_model/filter_providers.dart';

class SlaesViewModel extends AsyncNotifier<List<SalesModel>> {
  List<SalesModel> sales = [];
  int currentPage = 1;
  bool isLoading = false;
  @override
  FutureOr<List<SalesModel>> build() async {
    await fetchFromApi(page: currentPage);
    return sales;
  }

/*Fetch sales from api*/
  Future<void> fetchFromApi({required int page}) async {
    try {
      final fetchedSales = await SalesRepository.fetchSalesModel(page: page);
      sales.addAll(fetchedSales);
      state = AsyncData(sales);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

/*Reloading if error*/
  Future<void> reloadSalesData({String query = ''}) async {
    state = AsyncLoading();
    sales.clear();
    currentPage = 1;
    await fetchFromApi(page: currentPage);
  }

/*Loading more sales*/
  Future<void> loadMoreSales() async {
    isLoading = true;
    try {
      await fetchFromApi(page: currentPage + 1);
      currentPage++;
    } catch (e, stackTrace) {
      AsyncValue.error(e, stackTrace);
    }
  }

/*Searching and Filtering sales */
  Future<void> filterSales(String query) async {
    final filterCustomers = ref.watch(customerListFilterNotifierProvider);
    final filteredStatus = ref.watch(filterStatusSelectedProvider);

    if (filterCustomers.isEmpty && filteredStatus.isEmpty && query.isEmpty) {
      isLoading = true;
      state = AsyncData(sales);
      return;
    } else {
      isLoading = false;
    }

    final filteredSales = sales.where((e) {
      final matchesQuery =
          e.customerName.toLowerCase().contains(query.toLowerCase());

      final matchesCustomerList = filterCustomers.isEmpty
          ? true
          : filterCustomers
              .map((customer) => customer.toLowerCase())
              .contains(e.customerName.toLowerCase());

      final matchesStatus = filteredStatus.isEmpty
          ? true
          : e.status.toLowerCase() == filteredStatus.toLowerCase();

      return matchesQuery && matchesCustomerList && matchesStatus;
    }).toList();

    state = AsyncData(filteredSales);
  }
}

final salesDataProvider =
    AsyncNotifierProvider<SlaesViewModel, List<SalesModel>>(
  () => SlaesViewModel(),
);
