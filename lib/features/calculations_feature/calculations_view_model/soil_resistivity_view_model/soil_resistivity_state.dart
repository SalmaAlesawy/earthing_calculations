part of 'soil_resistivity_cubit.dart';

@immutable
sealed class SoilResistivityState {}

final class SoilResistivityInitial extends SoilResistivityState {}

final class AddMoreState extends SoilResistivityState {}

final class CalculateSoilResistivityState extends SoilResistivityState {}

final class OnSelectSpaceState extends SoilResistivityState {}
