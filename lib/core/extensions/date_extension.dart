import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get monthYear {
    return DateFormat('MMMM yyyy').format(this);
  }

  String get dateToDDMMYYYY {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
