import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/colors.dart';

class LoginBgContainer extends StatelessWidget {
  const LoginBgContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withAlpha((0.8 * 255).toInt()),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            AppColors.loginBgGradientColor1,
            AppColors.loginBgGradientColor2,
            AppColors.loginBgGradientColor3,
          ],
          stops: const [0.0, 0.2, 0.7, 1.0],
        ),
      ),
    );
  }
}
