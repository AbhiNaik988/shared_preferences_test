// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInState {
  final String username;
  final String password;
  final String usernameErrorText;
  final String passwordErrorText;
  final bool isChecked;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSubmitted;
  SignInState({
    this.username = "",
    this.password = "",
    this.usernameErrorText = "",
    this.passwordErrorText = "",
    this.isChecked = false,
    this.isUsernameValid = true,
    this.isPasswordValid = true,
    this.isSubmitting = false,
    this.isSubmitted = false
  });

  

  SignInState copyWith({
    String? username,
    String? password,
    String? usernameErrorText,
    String? passwordErrorText,
    bool? isChecked,
    bool? isUsernameValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSubmitted,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      usernameErrorText: usernameErrorText ?? this.usernameErrorText,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      isChecked: isChecked ?? this.isChecked,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  String toString() {
    return 'SignInState(username: $username, password: $password, usernameErrorText: $usernameErrorText, passwordErrorText: $passwordErrorText, isChecked: $isChecked, isUsernameValid: $isUsernameValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSubmitted: $isSubmitted)';
  }
}
