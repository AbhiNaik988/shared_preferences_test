import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_test/screens/login_screen.dart';
import 'package:shared_preferences_test/screens/screen_2.dart';
import 'package:shared_preferences_test/screens/screen_3.dart';

import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'blocs/sign_in_bloc/sign_in_events.dart';

class MyGeneratedRoutes {
  static final SignInBloc _myBloc = SignInBloc()..add(LoadUsernamePassword());
  
  static Route? generatedRoutes(RouteSettings settings) {
  
    
    switch (settings.name) {
      case "/signIn":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _myBloc,
            child: const LoginScreen(),
          ),
        );

      case "/screen2":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _myBloc,
            child: const Screen2(),
          ),
        );

      case "/screen3":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value:  _myBloc,
            child: const Screen3(),
          ),
        );

      default:
        return null;
    }
  }
}
