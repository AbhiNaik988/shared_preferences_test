import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(ThemeCubitState(isDarkEnabled: false));

  switchToDarkTheme(){
    emit(state.copyWith(isDarkEnabled: true));
  }

  switchToLightTheme(){
    emit(state.copyWith(isDarkEnabled: false));
  }
  
}
