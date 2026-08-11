part of 'register_password_confirm_cubit.dart';

@immutable
sealed class RegisterPasswordConfirmState {}

final class RegisterPasswordConfirmVisible extends RegisterPasswordConfirmState {}
final class RegisterPasswordConfirmUnVisible extends RegisterPasswordConfirmState{}
