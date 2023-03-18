import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_events.dart';
import 'package:shared_preferences_test/blocs/sign_in_bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(SignInState()) {

    on<LoadUsernamePassword>((event, emit) {
      emit(state.copyWith(username: event.username,password: event.password));
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

    // on<FormValid>((event, emit) {
    //   emit(state.copyWith(isPasswordValid: true,isUsernameValid: true,isFormValid: true));
    // });

    on<FormSubmitting>((event, emit) {
      emit(state.copyWith(isSubmitting: true));
    });

    on<FormSubmitted>((event, emit) {
      emit(state.copyWith(isSubmitting: false,isSubmitted: true));
    });
  }
}