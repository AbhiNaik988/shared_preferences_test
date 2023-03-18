import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_events.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../blocs/sign_in_bloc/sign_in_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences Test"),
        ),
        body: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return _loginForm(context, state);
          },
        ),
      ),
    );
  }

  Padding _loginForm(BuildContext context, SignInState state) {
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
            _rememberMeField(),
            _spacer(context),
            _submitButton(state),
          ],
        ),
      ),
    );
  }

  SizedBox _spacer(BuildContext context) => SizedBox(height: MediaQuery.of(context).size.height * 0.02);

  ElevatedButton _submitButton(SignInState state) {
    return ElevatedButton(
        onPressed: _checkIfFormValid(state)
            ? () {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            : null,
        child: const Text("Submit"));
  }

  Row _rememberMeField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            }),
        const SizedBox(width: 5),
        const Text("Remember me!")
      ],
    );
  }

  TextFormField _passwordFormField(BuildContext context, SignInState state) {
    return TextFormField(
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
  }

  TextFormField _usernameFormField(BuildContext context, SignInState state) {
    return TextFormField(
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
  }

  _checkIfFormValid(SignInState state) {
    return state.isUsernameValid &&
        state.isPasswordValid &&
        state.usernameErrorText != "" &&
        state.passwordErrorText != "";
  }
}
