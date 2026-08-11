import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_password_confirm_state.dart';

class RegisterPasswordConfirmVisibilityConfirmCubit extends Cubit<RegisterPasswordConfirmState> {
  RegisterPasswordConfirmVisibilityConfirmCubit() : super(RegisterPasswordConfirmVisible());
  bool confirmVisibility = true;
  Future<void> visibilityPasswordConfirm() async {
    confirmVisibility = !confirmVisibility;
    if (confirmVisibility == true) {
      emit(RegisterPasswordConfirmVisible());
    } else {
      emit(RegisterPasswordConfirmUnVisible());
    }
  }
}
