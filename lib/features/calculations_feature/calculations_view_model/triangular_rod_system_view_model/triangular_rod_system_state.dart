part of 'triangular_rod_system_cubit.dart';

@immutable
sealed class TriangularRodSystemState {}

final class TriangularRodSystemInitial extends TriangularRodSystemState {}
final class TriangularRodResistanceState extends TriangularRodSystemState{}
