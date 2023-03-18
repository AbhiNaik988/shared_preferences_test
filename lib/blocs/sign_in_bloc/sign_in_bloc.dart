import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_events.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(SignInState()) {

    on<LoadUsernamePassword>((event, emit) {
      Future<UserCredentials> credentials =  _loadUsernamePassword();
      final username = credentials.then((value) => value.username);
      final password = credentials.then((value) => value.password);

      emit(state.copyWith(usernameIfSaved: username,passwordIfSaved: password,isUsernameValid: true,isPasswordValid: true,usernameErrorText: "none",passwordErrorText: "none"));
    });
    
    on<UsernameChanged>((event, emit) {
      if(event.username.isEmpty){
        emit(state.copyWith(usernameErrorText: "Username can't be empty!",isUsernameValid: false));
      }
      else if(event.username.length < 3){
        emit(state.copyWith(usernameErrorText: "Username is too short!",isUsernameValid: false));
      }
      else{
        emit(state.copyWith(username: event.username ,isUsernameValid: true));
      }
    });

    on<PasswordChanged>((event, emit) {
      if(event.password.isEmpty){
        emit(state.copyWith(passwordErrorText: "Password can't be empty!",isPasswordValid: false));
      }
      else if(event.password.length < 8){
        emit(state.copyWith(passwordErrorText: "Password is too short!",isPasswordValid: false));
      }
      else{
        emit(state.copyWith(password: event.password, isPasswordValid: true));
      }
    });

    on<RememberMechaned>((event, emit) {
      emit(state.copyWith(isChecked: event.isChecked));
    });

    on<FormSubmitting>((event, emit) {
      _storeInSharedPreference(event.username,event.password);
      emit(state.copyWith(isSubmitting: true));
    });

    on<FormSubmitted>((event, emit) {
      emit(state.copyWith(isSubmitting: false,isSubmitted: true));
    });
  }
  
  void _storeInSharedPreference(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString("password", password);
  }

  Future<UserCredentials> _loadUsernamePassword() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final username = prefs.get("username");
    final password = prefs.get("password");

    return UserCredentials(username: username.toString(),password: password.toString());
  }
}

class UserCredentials {
  String username;
  String password;
  UserCredentials({
    required this.username,
    required this.password,
  });
}
