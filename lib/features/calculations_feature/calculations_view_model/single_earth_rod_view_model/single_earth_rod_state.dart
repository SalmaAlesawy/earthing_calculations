part of 'single_earth_rod_cubit.dart';

@immutable
sealed class SingleEarthRodState {}

final class SingleEarthRodInitial extends SingleEarthRodState {}

final class CalculateSingleRodResistanceState extends SingleEarthRodState {}
