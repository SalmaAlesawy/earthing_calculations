part of 'multiple_earth_rod_cubit.dart';

@immutable
sealed class MultipleEarthRodState {}

final class MultipleEarthRodInitial extends MultipleEarthRodState {}
final class MultipleEarthResistanceState extends MultipleEarthRodState{}
final class GroupFactorState extends MultipleEarthRodState{}
