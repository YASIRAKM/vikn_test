import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';

import 'package:vikn_test/core/constants/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget childWidget;
  Color? buttonColor;
  double? width;
  double? height;
  double? borderRadius;
  CustomButton(
      {super.key,
      required this.onPressed,
      required this.childWidget,
      this.width,
      this.height,
      this.borderRadius,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
          fixedSize: Size(width ?? double.maxFinite, height ?? 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius ?? AppDimensions.buttonBorderRadius),
          ),
          backgroundColor: buttonColor ?? AppColors.buttonColor,
        ),
        onPressed: onPressed,
        child: Center(child: childWidget));
  }
}
