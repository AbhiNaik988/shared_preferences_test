// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvents{}

class LoadUsernamePassword extends SignInEvents{
  final String username;
  final String password;

  LoadUsernamePassword({required this.username,required this.password});
}
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
// class FormValid extends SignInEvents{
//   final bool isValid;
//   FormValid({
//     required this.isValid,
//   });
// }
class FormSubmitting extends SignInEvents{}
class FormSubmitted extends SignInEvents {}
