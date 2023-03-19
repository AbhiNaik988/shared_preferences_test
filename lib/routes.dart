import 'package:flutter/material.dart';
import 'package:shared_preferences_test/screens/login_screen.dart';
import 'package:shared_preferences_test/screens/screen_2.dart';
import 'package:shared_preferences_test/screens/screen_3.dart';

class MyGeneratedRoutes {
  static Route? generatedRoutes(RouteSettings settings) {
  
    
    switch (settings.name) {
      case "/signIn":
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case "/screen2":
        return MaterialPageRoute(
          builder: (_) => const Screen2(),
        );

      case "/screen3":
        return MaterialPageRoute(
          builder: (_) => const Screen3(),
        );

      default:
        return null;
    }
  }
}
