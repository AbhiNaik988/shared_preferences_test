// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_events.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../blocs/sign_in_bloc/sign_in_states.dart';

class LoginScreen extends StatelessWidget {
  final SignInState state;
  const LoginScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Icon(Icons.menu,size: 30),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Sign In"),
              background: Image.network(
                "https://images.unsplash.com/photo-1678905029643-741e60ef88d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8NnNNVmpUTFNrZVF8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(child: state.isSubmitting ?  Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            child: const Center(child: CircularProgressIndicator()),
          ) : _loginForm(context, state)),
          SliverToBoxAdapter(
            child: state.isSubmitted ? const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Icon(Icons.done_all),
            ) : null,
          )
        ],
      )),
    );
  }

  Widget _loginForm(BuildContext context, SignInState state) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _usernameFormField(context, state),
            _spacer(context),
            _passwordFormField(context, state),
            _spacer(context),
            _rememberMeField(context, state),
            _spacer(context),
            _submitButton(context, state),
          ],
        ),
      ),
    );
  }

  SizedBox _spacer(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.height * 0.02);

  ElevatedButton _submitButton(BuildContext context, SignInState state) {
    return ElevatedButton(
        onPressed: _checkIfFormValid(state)
            ? () {
                FocusManager.instance.primaryFocus!.unfocus();
                if (state.isChecked) {
                  BlocProvider.of<SignInBloc>(context).add(FormSubmitting(
                      username: state.username, password: state.password));
                }
              }
            : null,
        child: const Text("Submit"));
  }

  Row _rememberMeField(BuildContext context, SignInState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: state.isChecked,
            onChanged: (value) {
              BlocProvider.of<SignInBloc>(context)
                  .add(RememberMechaned(isChecked: value!));
            }),
        const SizedBox(width: 5),
        const Text("Remember me!")
      ],
    );
  }

  Widget _passwordFormField(BuildContext context, SignInState state) {
    return FutureBuilder(
        future: state.passwordIfSaved,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return TextFormField(
            initialValue: snapshot.data,
            onChanged: (value) => BlocProvider.of<SignInBloc>(context)
                .add(PasswordChanged(password: value)),
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: state.isPasswordValid ? Colors.grey : Colors.red,
              ),
              contentPadding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
              labelText: "Password",
              hintText: "Enter password...",
              errorText: state.isPasswordValid ? null : state.passwordErrorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          );
        });
  }

  Widget _usernameFormField(BuildContext context, SignInState state) {
    return FutureBuilder<String>(
        future: state.usernameIfSaved,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return TextFormField(
            initialValue: snapshot.data,
            onChanged: (value) => BlocProvider.of<SignInBloc>(context)
                .add(UsernameChanged(username: value)),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.supervised_user_circle,
                  color: state.isUsernameValid ? Colors.grey : Colors.red),
              contentPadding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
              labelText: "Name",
              hintText: "Enter name...",
              errorText: state.isUsernameValid ? null : state.usernameErrorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          );
        });
  }

  _checkIfFormValid(SignInState state) {
    return state.isUsernameValid &&
        state.isPasswordValid &&
        state.usernameErrorText != "" &&
        state.passwordErrorText != "";
  }
}
