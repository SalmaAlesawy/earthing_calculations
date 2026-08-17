part of 'new_soil_test_cubit.dart';

@immutable
sealed class NewSoilTestState {}

final class NewSoilTestInitial extends NewSoilTestState {}

final class NewTestStepChangedState extends NewSoilTestState {
  final int currentStep;
  NewTestStepChangedState(this.currentStep);
}
