import 'dart:ffi';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'measurements_state.dart';

class MeasurementsCubit extends Cubit<MeasurementsState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MeasurementsCubit() : super(MeasurementsInitial());
  int index = 3;
  int points = 1;

  List<List<double>> allSoilResistivity = [];
  List<List<double>> probeSpacing = [
    [1, 2, 3],
    [2, 3, 5],
  ];
  List<double>? selectedSpacing;
  List<double> averagePoints=[];
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
    print("Added $index");
    print("point $points");
    print(resistanceControllers.length);
    emit(AddMoreState());
  }

  void delete() {
    points--;
    resistanceControllers.removeLast();
    print(resistanceControllers.length);
    print("point $points");
    emit(AddMoreState());
  }

  void calculations(String resistance, double probeSpacing, int pointIndex) {
    double? resistanceValue = double.tryParse(resistance.trim());
    // if (resistanceValue == null || probeSpacing == null) {
    //   return;
    // }
    double soilResistivity = 2 * pi * probeSpacing * resistanceValue!;
    print("soilResistivity: $soilResistivity");
    allSoilResistivity?[pointIndex].add(soilResistivity);
    print("allSoilResistivity: $allSoilResistivity");
    emit(CalculateSoilResistivityState());
  }

  void calculatePointAverage(int pointIndex) {
    if(pointIndex>=allSoilResistivity.length){
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
      if (allSoilResistivity![i].isNotEmpty) {
        pointsAverage.add(averagePoints[i]);
      }
      else{
        return 0;
      }
    }
    if (averagePoints.isEmpty) return 0;
     finalAverage = averagePoints.reduce((a, b) => a + b) / averagePoints.length;
     emit(CalculateSoilResistivityState());
     return finalAverage;
  }
}
