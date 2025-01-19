import 'package:vikn_test/core/constants/icons.dart';
import 'package:vikn_test/features/home/model/chard_data_model.dart';

List<Map<String, String>> bottomNavItems = [
  {"Home": AppIcons.bottomNavHomeIcon},
  {"Navigation": AppIcons.bottomNavRoueIcon},
  {"Notification": AppIcons.bottomNavNotificationIcon},
  {"Profile": AppIcons.bottomNavProfileIcon},
];

List<String> dateFilterItems = [
  "This Month",
  "3 Months",
  "6 Months",
  "9 Months"
];
List<String> customerList = [
  "jasmal",
  "cash in hand",
  "Customer3",
  "Customer4"
];

List<int> dayList = List.generate(
  DateTime.now().day,
  (index) => index + 1,
);

List<ChartDataPoint> chartData = [
  ChartDataPoint(x: 0.2, y: 600),
  ChartDataPoint(x: 1, y: 3945),
  ChartDataPoint(x: 2, y: 2000),
  ChartDataPoint(x: 3, y: 2500),
  ChartDataPoint(x: 4, y: 3500),
  ChartDataPoint(x: 5, y: 3000),
  ChartDataPoint(x: 5.7, y: 1500),
];
