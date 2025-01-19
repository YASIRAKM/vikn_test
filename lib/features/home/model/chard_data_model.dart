import 'package:fl_chart/fl_chart.dart';

class ChartDataPoint {
  final double x;
  final double y;

  ChartDataPoint({required this.x, required this.y});

  // Optional: You can add a method to convert it to an FlSpot if needed
  FlSpot toFlSpot() {
    return FlSpot(x, y);
  }
}