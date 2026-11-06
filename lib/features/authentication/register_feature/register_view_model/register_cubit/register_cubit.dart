import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void signupWithEmailAndPassword(String emailAddress, String password) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (error) {
      String errorMessage;
      switch (error.code) {
        case "email-already-in-use":
          errorMessage = "Email is already registered";
          break;
        case "invalid-email":
          errorMessage = "Email address is invalid";
          break;
        case "weak-password":
          errorMessage = "Password is too weak";
          break;
        case "operation-not-allowed":
          errorMessage = "Email/password registration is disabled";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests were made, try again later";
        case "network-request-failed":
          errorMessage = "Internet connection problem";
          break;
        default:
          errorMessage = "Sign up failed,please try again";
          break;
      }
      emit(RegisterError(errorMessage: errorMessage));
    } catch (error) {
      emit(RegisterError(errorMessage: error.toString()));
    }
  }
}
