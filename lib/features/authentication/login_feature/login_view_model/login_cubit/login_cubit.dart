import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void getUserCredential(AuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signInWithEmailAndPassword(String email, String password) async {
    emit(LoadingLogin());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SuccessLogin());
    } on FirebaseAuthException catch (error) {
      String errorMessage;
      switch (error.code) {
        case 'invalid-credential':
        case 'wrong-password':
        case 'user-not-found':
          errorMessage = "Incorrect email or password or user not found";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;
        case 'user-disabled':
          errorMessage = "This account has been disabled";
          break;
        case 'too-many-requests':
          errorMessage = "Too many attempts.please try again later";
          break;
        default:
          errorMessage = "Login failed. Please try again";
      }
      emit(ErrorLogin(errorMessage: errorMessage));
    } catch (error) {
      emit(ErrorLogin(errorMessage: "Some thing went wrong"));
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void getProfileInformation(User user) {
    for (final providerProfile in user.providerData) {
      providerProfile.providerId;
      providerProfile.uid;
      providerProfile.displayName;
      providerProfile.email;
    }
  }

  void updateName(User user, String displayName) async {
    await user.updateDisplayName(displayName);
  }

  void deleteUser(User user) async {
    await user.delete();
  }
}
