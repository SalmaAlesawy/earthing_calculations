import 'package:earthing_calc/core/dataBases/cache/cache_helper.dart';
import 'package:earthing_calc/core/pdfs/generate_pdf.dart';
import 'package:earthing_calc/core/shared_view_models/export_pdf_cubit/export_pdf_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}

void setUpDependencies() {
  getIt.registerLazySingleton<PdfService>(() => PdfService());

  getIt.registerFactory<ExportPdfCubit>(
    () => ExportPdfCubit(pdfService: getIt<PdfService>()),
  );
}
