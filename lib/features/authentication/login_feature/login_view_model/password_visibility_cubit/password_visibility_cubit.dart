import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisible());
  bool loginPasswordVisibility = true;
  Future<void> visibilityPassword() async {
    loginPasswordVisibility = !loginPasswordVisibility;
    if (loginPasswordVisibility == true) {
      emit(PasswordVisible());
    } else {
      emit(PasswordUnVisible());
    }
  }
}
