import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

part 'soil_resistivity_state.dart';

class SoilResistivityCubit extends Cubit<SoilResistivityState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScreenshotController screenshotController = ScreenshotController();
  SoilResistivityCubit() : super(SoilResistivityInitial());
  int index = 3;
  int points = 1;

  List<List<double>> allSoilResistivity = [];
  List<List<double>> probeSpacing = [
    [1, 2, 3],
    [2, 3, 5],
  ];
  List<double>? selectedSpacing;
  List<double> averagePoints = [];
  double? finalAverage;
  void onSelectSpace(List<double> value) {
    selectedSpacing = value;
    emit(OnSelectSpaceState());
  }

  List<List<TextEditingController>> resistanceControllers = [
    [TextEditingController(), TextEditingController(), TextEditingController()],
  ];
  void addMore() {
    points++;
    resistanceControllers.add(List.generate(3, (_) => TextEditingController()));
    allSoilResistivity.add([]);
    emit(AddMoreState());
  }

  void delete() {
    points--;
    resistanceControllers.removeLast();
    emit(AddMoreState());
  }

  void calculations(String resistance, double probeSpacing, int pointIndex) {
    double? resistanceValue = double.tryParse(resistance.trim());

    double soilResistivity = 2 * pi * probeSpacing * resistanceValue!;
    allSoilResistivity[pointIndex].add(soilResistivity);
    emit(CalculateSoilResistivityState());
  }

  void calculatePointAverage(int pointIndex) {
    if (pointIndex >= allSoilResistivity.length) {
      return;
    }
    final values = allSoilResistivity[pointIndex];
    if (values.isEmpty) return;
    final average = values.reduce((a, b) => a + b) / values.length;
    averagePoints.add(average);
    emit(CalculateSoilResistivityState());
  }

  double? calculateFinalAverage() {
    final pointsAverage = <double>[];
    for (int i = 0; i < allSoilResistivity.length; i++) {
      if (allSoilResistivity[i].isNotEmpty) {
        pointsAverage.add(averagePoints[i]);
      } else {
        return 0;
      }
    }
    if (averagePoints.isEmpty) return 0;
    finalAverage = averagePoints.reduce((a, b) => a + b) / averagePoints.length;
    emit(CalculateSoilResistivityState());
    return finalAverage;
  }
}
