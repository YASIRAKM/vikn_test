import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/app_typography.dart';
import 'package:vikn_test/core/constants/colors.dart';
import 'package:vikn_test/core/constants/icons.dart';
import 'package:vikn_test/core/utils/show_message.dart';
import 'package:vikn_test/core/utils/transparent_dialoge.dart';
import 'package:vikn_test/features/auth/view/widgets/bg_view.dart';
import 'package:vikn_test/features/auth/view/widgets/log_text_fields_widget.dart';
import 'package:vikn_test/features/auth/view_model/auth_view_model.dart';
import 'package:vikn_test/features/home/view/bottom_navigation_widget.dart';
import 'package:vikn_test/main.dart';
import 'package:vikn_test/shared/widgets/custom_button.dart';
import 'package:vikn_test/shared/widgets/icon_view.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    final authNotifier = ref.read(authProvider.notifier);
    _loginLoadingHandler(ref, context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            LoginBgContainer(),
            _loginBody(size, authNotifier),
          ],
        ),
      ),
    );
  }

/*login state loading/navigation */
  void _loginLoadingHandler(WidgetRef ref, BuildContext context) {
    ref.listen<AsyncValue>(
      authProvider,
      (previous, next) {
        if (next is AsyncLoading) {
          transparentDialog(context);
        } else {
          if (Navigator.canPop(context)) {
            navigatorKey.currentState!.pop();
          }
        }

        if (next is AsyncData) {
          if (next.value.isAuthenticated) {
            _usernameController.clear();
            _passwordController.clear();
            navigatorKey.currentState!.pushAndRemoveUntil(
              CupertinoPageRoute(
                  builder: (context) => BottomNavigationWidget()),
              (route) => false,
            );
          } else {
            showMessage(message: next.value.message);
          }
        }

        if (next is AsyncError) {
          showMessage(message: next.error.toString());
        }
      },
    );
  }

/*login body */
  Container _loginBody(Size size, AuthViewModel authNotifier) {
    return Container(
      color: AppColors.backgroundColor.withAlpha((.8 * 255).toInt()),
      padding: EdgeInsets.symmetric(vertical: size.height * .02),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconView(
                height: 16,
                width: 16,
                icon: AppIcons.languageIcon,
                color: AppColors.primaryColor,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.textColor),
                  onPressed: () {},
                  child: const Text("English"))
            ],
          ),
          SizedBox(
            height: size.height * 0.18,
          ),
          Text(
            "Login",
            style: AppTypography.heading1,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Login to your vikn account",
            style: AppTypography.cardSubTitle,
          ),
          const SizedBox(
            height: 36,
          ),
          LoginTextFieldsView(
              formKey: _formKey,
              usernameController: _usernameController,
              passwordController: _passwordController),
          const SizedBox(
            height: 12,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.buttonColor2),
              onPressed: () {},
              child: const Text("Forgotten Password?")),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
              width: size.width * .35,
              height: 50,
              buttonColor: AppColors.buttonColor2,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await authNotifier.login(
                      username: _usernameController.text.trim(),
                      password: _passwordController.text.trim());
                }
              },
              childWidget: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 8,
                children: [Text("Sign in"), Icon(Icons.arrow_forward_rounded)],
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        maximumSize: Size(size.width * 0.8, 40),
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.textColor),
                    onPressed: () {},
                    child: const Text("Don't have an Account?")),
                TextButton(
                    style: TextButton.styleFrom(
                        maximumSize: Size(size.width * 0.8, 40),
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.buttonColor2),
                    onPressed: () {},
                    child: const Text("Sign up now!")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
