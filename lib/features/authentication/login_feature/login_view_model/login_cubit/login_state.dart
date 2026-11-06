part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoadingLogin extends LoginState {}

final class SuccessLogin extends LoginState {}

final class ErrorLogin extends LoginState {
  final String errorMessage;
  ErrorLogin({required this.errorMessage});
}
