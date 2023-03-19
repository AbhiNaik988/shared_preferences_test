import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_test/blocs/observer.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_events.dart';
import 'package:shared_preferences_test/cubits/theme_cubit/theme_cubit_cubit.dart';
import 'package:shared_preferences_test/routes.dart';

void main() {
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(
            create: (BuildContext context) =>
                SignInBloc()..add(LoadUsernamePassword()),
          ),
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeCubitState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Shared Preferences Test',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: MyGeneratedRoutes.generatedRoutes,
              initialRoute: "/signIn",
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme(
                  primary: Colors.grey,
                  secondary: Colors.grey,
                  brightness: Brightness.dark,
                  onPrimary: Color.alphaBlend(Colors.white, Colors.grey),
                  onSecondary: Color.alphaBlend(Colors.white, Colors.grey),
                  error: Colors.red,
                  onError: Color.alphaBlend(Colors.white, Colors.grey),
                  background: Colors.grey,
                  onBackground: Color.alphaBlend(Colors.white, Colors.grey),
                  surface: Colors.black,
                  onSurface: Colors.white,
                ),
              ),
              themeMode: state.isDarkEnabled 
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
        ));
  }
}
