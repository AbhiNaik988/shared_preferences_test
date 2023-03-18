import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../blocs/sign_in_bloc/sign_in_states.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.usernameIfSaved.toString()),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signIn");
                  },
                  child: const Text("To Sign In")),
            ],
          );
        },
      ),
    );
  }
}
