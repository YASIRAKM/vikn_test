import 'package:flutter/material.dart';
import 'package:vikn_test/core/constants/app_dmensions.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/icons.dart';
import 'package:vikn_test/shared/widgets/custom_text_field.dart';

class LoginTextFieldsView extends StatelessWidget {
  const LoginTextFieldsView({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _usernameController = usernameController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.all(
        AppDimensions.paddingSmall,
      ),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: AppColors.dividerColor.withAlpha((.1 * 255).toInt()),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.dividerColor, width: 0.5)),
      child: Form(
        key: _formKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomTextField(
              validate: true,
              controller: _usernameController,
              labelText: "Username",
              prefixIcon: AppIcons.usernameIcon),
          const Divider(color: AppColors.dividerColor, thickness: 0.5),
          CustomTextField(
            validate: true,
            controller: _passwordController,
            labelText: "Password",
            prefixIcon: AppIcons.passwordIcon,
            isPasswordField: true,
          ),
        ]),
      ),
    );
  }
}