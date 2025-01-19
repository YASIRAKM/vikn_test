import 'package:flutter_riverpod/flutter_riverpod.dart';

/*filter from date */
final fromDateProvider = StateProvider<DateTime>(
  (ref) => DateTime.now(),
);

/*filter To  date */

final toDateProvider = StateProvider<DateTime>(
  (ref) => DateTime.now(),
);
/*filter Status  */

final filterStatusSelectedProvider = StateProvider<String>(
  (ref) {
    return "";
  },
);

/*Filter with multiple customer */
class CustomerListFilterNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return selectedCustomer;
  }

  List<String> selectedCustomer = [];
  addCustomer(String customer) {
    if (state.contains(customer)) {
    } else {
      state = [...state, customer];
    }
  }

  void removeCustomer(String customer) {
    state = [
      for (final item in state)
        if (item != customer) item,
    ];
  }

  void clear() {
    state = [];
  }
}

final customerListFilterNotifierProvider =
    NotifierProvider<CustomerListFilterNotifier, List<String>>(
  () => CustomerListFilterNotifier(),
);
