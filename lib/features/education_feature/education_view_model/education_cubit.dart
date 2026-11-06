import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());
  Future<void> openCatalog() async {
    final Uri url = Uri.parse(
      'https://drive.google.com/file/d/1mAvhaRECwWaOa0Vmdv6uNCYgw44BtE4T/view?usp=drivesdk',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open PDF");
    }
    emit(OpenCatalogState());
  }
}
