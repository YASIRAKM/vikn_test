import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class IconView extends StatelessWidget {
  final String icon;
  Color? color;
  double? height;
  double? width;
  IconView(
      {super.key, required this.icon, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      fit: BoxFit.contain,
      icon,
      colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
      height: height ?? 15,
      width: 15,
    );
  }
}
