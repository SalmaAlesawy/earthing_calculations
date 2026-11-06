part of 'export_pdf_cubit.dart';

@immutable
sealed class ExportPdfState {}

final class ExportPdfInitial extends ExportPdfState {}
final class LoadingPdfState extends ExportPdfState{}
final class SuccessExportingPdfState extends ExportPdfState{
  final Uint8List pdfBytes;
  SuccessExportingPdfState({required this.pdfBytes});
}
final class ErrorExportingPdfState extends ExportPdfState{
  final String errorMessage;
  ErrorExportingPdfState({required this.errorMessage});
}