part of 'password_visibility_cubit.dart';

sealed class PasswordVisibilityState {}

final class PasswordVisible extends PasswordVisibilityState {}

final class PasswordUnVisible extends PasswordVisibilityState {}
