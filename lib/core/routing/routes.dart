import 'package:flutter/material.dart';
import 'package:syria_meds/core/routing/menu/menu_model.dart';
import 'package:syria_meds/features/auth/presentation/login.dart';
import 'package:syria_meds/features/home/presentation/home.dart';
import 'package:syria_meds/features/layout_screen.dart';
import 'package:syria_meds/features/profile/profile_screen.dart';

class RouteNames {
  static const String loginScreen = 'loginScreen';
  static const String layoutScreen = 'layoutScreen';
  static const String homeScreen = 'homeScreen';
  static const String profileScreen = "profileScreen";
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.layoutScreen:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static Widget getScreen(MenuItem currentItem) {
    switch (currentItem) {
      case MenuItems.home:
        return const Home();
      case MenuItems.profile:
        return const ProfileScreen();
      default:
        return const Home();
    }
  }
}
