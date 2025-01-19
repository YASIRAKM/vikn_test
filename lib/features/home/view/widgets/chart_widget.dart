import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/lists.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(_mainChart());
  }
}

/*Chart Data */
LineChartData _mainChart() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: 1000,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey[800],
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      leftTitles: _leftTileData(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 6,
    minY: 0,
    maxY: 5000,
    lineBarsData: [
      _lineChartBarData(),
    ],
    lineTouchData: _lineTouchData(),
  );
}

/*Line Chart bar Data */
LineChartBarData _lineChartBarData() {
  return LineChartBarData(
    spots: chartData.map((dataPoint) => dataPoint.toFlSpot()).toList(),
    isCurved: true,
    color: AppColors.selectedColor,
    barWidth: 2,
    belowBarData: BarAreaData(
      show: true,
      gradient: LinearGradient(
        colors: [
          AppColors.selectedColor.withAlpha((.3 * 255).toInt()),
          AppColors.selectedColor.withAlpha((.1 * 255).toInt()),
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    dotData: FlDotData(show: false),
  );
}

/*Line Touch Data */
LineTouchData _lineTouchData() {
  return LineTouchData(
    getTouchedSpotIndicator: (barData, indicators) {
      return indicators.map((indicator) {
        return TouchedSpotIndicatorData(
          FlLine(
            color: AppColors.textColor,
            strokeWidth: 1,
          ),
          FlDotData(
            show: false,
          ),
        );
      }).toList();
    },
    touchSpotThreshold: 50,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) {
        return Colors.transparent;
      },
      getTooltipItems: (touchedSpots) {
        return touchedSpots.map((spot) {
          return LineTooltipItem(
            'SAR ${spot.y.toStringAsFixed(2)}',
            AppTypography.body1,
          );
        }).toList();
      },
    ),
    handleBuiltInTouches: true,
  );
}

/*Left Tiles data*/
AxisTitles _leftTileData() {
  return AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 20,
      interval: 1000,
      getTitlesWidget: (value, meta) {
        switch (value.toInt()) {
          case 0:
            return Text("0k",
                style: TextStyle(color: Colors.grey[500], fontSize: 10));
          case 1000:
            return Text("1k",
                style: TextStyle(color: Colors.grey[500], fontSize: 10));
          case 2000:
            return Text("2k",
                style: TextStyle(color: Colors.grey[500], fontSize: 10));
          case 3000:
            return Text("3k",
                style: TextStyle(color: Colors.grey[500], fontSize: 10));
          case 4000:
            return Text("4k",
                style: TextStyle(color: Colors.grey[500], fontSize: 10));
          default:
            return const SizedBox.shrink();
        }
      },
    ),
  );
}
