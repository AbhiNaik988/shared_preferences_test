import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_states.dart';
import 'package:shared_preferences_test/screens/login_screen.dart';
import 'package:shared_preferences_test/screens/screen_2.dart';
import 'package:shared_preferences_test/screens/screen_3.dart';

import 'blocs/sign_in_bloc/sign_in_bloc.dart';

class MyGeneratedRoutes {
  static Route? generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/signIn":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: SignInBloc(),
            child: const LoginScreen(),
          ),
        );

      case "/screen2":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: SignInBloc(),
            child: const Screen2(),
          ),
        );

      case "/screen3":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value:  SignInBloc(),
            child: const Screen3(),
          ),
        );

      default:
        return null;
    }
  }
}
