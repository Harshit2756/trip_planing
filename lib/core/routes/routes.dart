import 'package:flutter/material.dart';

import '../../view/auth/login_view.dart';
import '../../view/home/home_view.dart';
import 'routes_name.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeView:
        return MaterialPageRoute(builder: (_) {
          final args = settings.arguments as Map<String, dynamic>;
          return HomeView(
            name: args['name'],
          );
        });

      case RoutesName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      // case RoutesName.otpView:
      //   return MaterialPageRoute(builder: (_) => const OtpView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
