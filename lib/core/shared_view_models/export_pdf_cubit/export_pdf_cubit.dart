import 'dart:typed_data';

import 'package:earthing_calc/core/pdfs/generate_pdf.dart';
import 'package:earthing_calc/core/shared_view_models/screenshot_cubit/screenshot_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

part 'export_pdf_state.dart';

class ExportPdfCubit extends Cubit<ExportPdfState> {
  ExportPdfCubit({required this.pdfService}) : super(ExportPdfInitial());
  final PdfService pdfService;
  Future<void> exportPdf({
    required ScreenshotController controller,
    required BuildContext context,
    required Widget screenContent,
    required String title,
  }) async {
    try {
      emit(LoadingPdfState());
      final imageBytes = await controller.capture(pixelRatio: 3.0);

      final pdfBytes = await pdfService.generatePdf(imageBytes!, title);
      if (!context.mounted) return;
      final screenshotCubit = context.read<ScreenshotCubit>();
      debugPrint("Export Cubit instance: ${identityHashCode(screenshotCubit)}");
      screenshotCubit.addScreenshot(pdfBytes);
      emit(SuccessExportingPdfState(pdfBytes: pdfBytes));
    } catch (e) {
      emit(ErrorExportingPdfState(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
