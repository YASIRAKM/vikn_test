import 'package:flutter_riverpod/flutter_riverpod.dart';

/*Index for dashbord date selector */
final selectedIndexProvider = StateProvider<int>(
  (ref) => 0,
);

/*Indexx for bottom navigation bar */
final bottomNavigationIndexProvider = StateProvider<int>(
  (ref) => 0,
);
