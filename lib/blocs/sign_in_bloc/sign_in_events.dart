// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvents{}

class LoadUsernamePassword extends SignInEvents{}
class UsernameChanged extends SignInEvents {
  final String username;
  UsernameChanged({
    required this.username,
  });
}
class PasswordChanged extends SignInEvents {
  final String password;
  PasswordChanged({
    required this.password,
  });
}
class RememberMechaned extends SignInEvents {
  final bool isChecked;
  RememberMechaned({
    required this.isChecked,
  });
}

class FormSubmitting extends SignInEvents {
  final String username;
  final String password;

  FormSubmitting({
    required this.username,
    required this.password,
  });
}
class FormSubmitted extends SignInEvents {}
