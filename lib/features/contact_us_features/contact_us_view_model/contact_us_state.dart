part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class OpenWhatsAppState extends ContactUsState {}

final class OpenPhoneCallState extends ContactUsState {}

final class OpenGmailState extends ContactUsState {}
