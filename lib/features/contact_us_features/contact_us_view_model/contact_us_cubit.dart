import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  String phoneNumber = "966502611665";
  Future<void> openWhatsApp() async {
    final Uri uri = Uri.parse('https://wa.me/$phoneNumber');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    emit(OpenWhatsAppState());
  }

  Future<void> sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'Yousef.aissawy@bahra-electric.com',
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not open email application');
    }
    emit(OpenGmailState());
  }

  Future<void> makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '966501234567');
    if (!await launchUrl(phoneUri)) {
      throw Exception("Could not open phone dialer");
    }
    emit(OpenPhoneCallState());
  }
}
