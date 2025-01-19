import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/extensions/string_extension.dart';
import 'package:vikn_test/shared/providers/password_visibility_provider.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final dynamic prefixIcon;
  final bool validate;

  final bool isPasswordField;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.prefixIcon,
      this.isPasswordField = false,
      this.validate = false});

  @override
  Widget build(BuildContext context) {
    if (isPasswordField) {
      return Consumer(
        builder: (context, ref, _) {
          final isVisible = ref.watch(passwordVisibilityProvider);
          return buildTextField(
            context,
            obscureText: !isVisible,
            toggleVisibility: () {
              ref.read(passwordVisibilityProvider.notifier).state = !isVisible;
            },
            isVisible: isVisible,
          );
        },
      );
    } else {
      return buildTextField(context);
    }
  }

  Widget buildTextField(
    BuildContext context, {
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    bool? isVisible,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: AppTypography.textFieldStyle,
      validator: validate
          ? (value) {
              if (value == null || value.isEmpty) {
                return "$labelText required";
              } else if (labelText.toLowerCase() == "password") {
                (bool, String) valid = value.isPassword;
                if (!valid.$1) {
                  return valid.$2;
                }
              } else if (labelText.toLowerCase() == "username") {
                (bool, String) valid = value.isUserName;
                if (!valid.$1) {
                  return valid.$2;
                }
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        errorStyle: AppTypography.logout
            .copyWith(fontWeight: FontWeight.bold, fontSize: 9),
        labelText: labelText,
        prefixIconColor: AppColors.primaryColor,
        prefixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 30),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon.runtimeType == IconData
            ? Icon(
                prefixIcon,
                color: AppColors.primaryColor,
              )
            : Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingSmall),
                child: IconView(
                  icon: prefixIcon,
                  color: AppColors.primaryColor,
                ),
              ),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isVisible! ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryColor,
                ),
                onPressed: toggleVisibility,
              )
            : null,
        border: InputBorder.none,
        isDense: true,
      ),
    );
  }
}
