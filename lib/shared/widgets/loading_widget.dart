import 'package:flutter/material.dart';

import 'package:vikn_test/core/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingMessage;
  final double? size;
  final Color? color;

  const LoadingWidget({
    super.key,
    this.loadingMessage,
    this.size = 25.0,
    this.color = AppColors.linkTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color!),
              strokeWidth: 3.0,
              value: null,
              backgroundColor: Colors.transparent,
            ),
          ),
          if (loadingMessage != null) ...[
            const SizedBox(height: 20.0),
            Text(
              loadingMessage!,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: color,
                letterSpacing: 1,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
