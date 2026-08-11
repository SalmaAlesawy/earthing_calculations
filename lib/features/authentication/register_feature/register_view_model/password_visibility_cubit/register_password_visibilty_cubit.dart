import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_password_visibilty_state.dart';

class RegisterPasswordVisibilityCubit extends Cubit<RegisterPasswordVisibilityState> {
  RegisterPasswordVisibilityCubit() : super(RegisterPasswordVisibleState());
  bool registerPasswordVisibility = true;
  Future<void> registerVisibilityPassword() async {
    registerPasswordVisibility = !registerPasswordVisibility;
    if (registerPasswordVisibility == true) {
      emit(RegisterPasswordVisibleState());
    } else {
      emit(RegisterPasswordUnVisibleState());
    }
  }
}
