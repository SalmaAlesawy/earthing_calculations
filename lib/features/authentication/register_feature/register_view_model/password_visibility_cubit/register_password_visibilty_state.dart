part of 'register_password_visibilty_cubit.dart';

@immutable
sealed class RegisterPasswordVisibilityState {}

final class RegisterPasswordVisibleState extends RegisterPasswordVisibilityState {}
final class RegisterPasswordUnVisibleState extends RegisterPasswordVisibilityState{}
