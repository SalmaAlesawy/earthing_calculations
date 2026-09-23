part of 'cable_sizing_cubit.dart';

@immutable
sealed class CableSizingState {}

final class CableSizingInitial extends CableSizingState {}
final class CalculateAreaState extends CableSizingState{}
final class CalculateCoefficientState extends CableSizingState{}
