// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit_cubit.dart';


class ThemeCubitState {
  final bool isDarkEnabled;
  ThemeCubitState({
    required this.isDarkEnabled,
  }); 

  ThemeCubitState copyWith({
    bool? isDarkEnabled,
  }) {
    return ThemeCubitState(
      isDarkEnabled: isDarkEnabled ?? this.isDarkEnabled,
    );
  }
}
