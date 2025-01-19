import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/constants/strings.dart';
import 'package:vikn_test/core/service/shared_preference_helper.dart';

import 'package:vikn_test/features/auth/view/login_screan.dart';
import 'package:vikn_test/features/home/view/bottom_navigation_widget.dart';
import 'package:vikn_test/shared/widgets/loading_widget.dart';

void main() async {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: SplashScreen(),
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  void _checkLoginStatus() async {
    String userId = await SharedPrefHelper.getValue(AppStrings.userId) ?? "";
    String accessToken =
        await SharedPrefHelper.getValue(AppStrings.accessTokenKey) ?? "";
    await Future.delayed(Duration(seconds: 3));

    if (userId.isEmpty &&
        userId == "" &&
        accessToken.isEmpty &&
        accessToken == "") {
      navigatorKey.currentState!.pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
    } else {
      navigatorKey.currentState!.pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => BottomNavigationWidget(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget();
  }
}
