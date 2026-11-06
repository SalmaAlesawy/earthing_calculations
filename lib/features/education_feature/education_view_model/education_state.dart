part of 'education_cubit.dart';

@immutable
sealed class EducationState {}

final class EducationInitial extends EducationState {}

final class OpenCatalogState extends EducationState {}
