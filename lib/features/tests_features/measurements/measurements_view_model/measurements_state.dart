part of 'measurements_cubit.dart';

@immutable
sealed class MeasurementsState {}

final class MeasurementsInitial extends MeasurementsState {}
final class AddMoreState extends MeasurementsState{}
final class CalculateSoilResistivityState extends MeasurementsState{}
final class OnSelectSpaceState extends MeasurementsState{}