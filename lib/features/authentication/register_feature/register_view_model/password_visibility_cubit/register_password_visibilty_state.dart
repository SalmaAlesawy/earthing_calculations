part of 'register_password_visibilty_cubit.dart';

sealed class RegisterPasswordVisibilityState {}

final class RegisterPasswordVisibleState
    extends RegisterPasswordVisibilityState {}

final class RegisterPasswordUnVisibleState
    extends RegisterPasswordVisibilityState {}
