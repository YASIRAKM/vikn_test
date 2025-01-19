import 'package:flutter/material.dart';

import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/main.dart';
import 'package:vikn_test/shared/widgets/custom_button.dart';

Future<dynamic> confirmDialoge({
  required BuildContext context,
  required String title,
  String content = "",
  required VoidCallback onPressed,
  required String buttonText,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.textFiedlBorderRadius)),
          child: Container(
            width: 300,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius:
                    BorderRadius.circular(AppDimensions.textFiedlBorderRadius),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withAlpha((.1 * 255).toInt()),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTypography.dialogeTitle),
                const SizedBox(
                  height: 3.5,
                ),
                Text(content, style: AppTypography.dialogSubTitle),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      height: 40,
                      buttonColor: AppColors.cardColor,
                      width: 100,
                      childWidget: Text("Cancel"),
                      onPressed: () {
                        navigatorKey.currentState!.pop();
                      },
                    ),
                    CustomButton(
                      height: 40,
                      buttonColor: AppColors.logoutColor,
                      width: 100,
                      childWidget: Text(buttonText),
                      onPressed: onPressed,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
