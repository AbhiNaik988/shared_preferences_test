import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_test/blocs/observer.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_events.dart';
import 'package:shared_preferences_test/routes.dart';
import 'package:shared_preferences_test/screens/login_screen.dart';

void main() {
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Test',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyGeneratedRoutes.generatedRoutes,
      initialRoute: "/signIn",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
