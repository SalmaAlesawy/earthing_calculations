import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'export_pdf_state.dart';

class ExportPdfCubit extends Cubit<ExportPdfState> {
  ExportPdfCubit() : super(ExportPdfInitial());
}
