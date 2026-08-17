import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'measurements_state.dart';

class MeasurementsCubit extends Cubit<MeasurementsState> {
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  MeasurementsCubit() : super(MeasurementsInitial());
  int index = 3;
  double? averageResistance;
  double? soilResistivity;
  TextEditingController probeSpacingController = TextEditingController();
  List<TextEditingController> resistanceControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  void addMore() {
    index++;
    resistanceControllers.add(TextEditingController());
    emit(AddMoreState());
  }

  void delete() {
    index--;
    resistanceControllers.removeLast();
    emit(AddMoreState());
  }

  double? calculations(String resistance, String probeSpacing) {
    double? resistanceValue =double.tryParse(resistance.trim());
    final double? spacingValue = double.tryParse(probeSpacing.trim());
    if(resistanceValue==null||spacingValue==null){
      return null;
    }
    soilResistivity = 2 * pi * spacingValue * resistanceValue;
    emit(CalculateSoilResistivityState());
    return soilResistivity!;
  }
}
