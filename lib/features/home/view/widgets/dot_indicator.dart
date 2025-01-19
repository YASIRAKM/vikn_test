import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int selectedIndex;
  final int index;

  const DotIndicator({
    super.key,
    required this.selectedIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: selectedIndex == index ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
