// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInState {
  final String usernameErrorText;
  final String passwordErrorText;
  final bool isChecked;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSubmitted;
  SignInState({
    this.usernameErrorText = "",
    this.passwordErrorText = "",
    this.isChecked = false,
    this.isUsernameValid = true,
    this.isPasswordValid = true,
    this.isSubmitting = false,
    this.isSubmitted = false
  });

  SignInState copyWith({
    String? usernameErrorText,
    String? passwordErrorText,
    bool? isChecked,
    bool? isUsernameValid,
    bool? isPasswordValid,
    bool? isFormValid,
    bool? isSubmitting,
    bool? isSubmitted,
  }) {
    return SignInState(
      usernameErrorText: usernameErrorText ?? this.usernameErrorText,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      isChecked: isChecked ?? this.isChecked,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}
