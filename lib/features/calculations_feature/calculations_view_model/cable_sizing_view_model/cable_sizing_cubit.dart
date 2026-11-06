import 'dart:math';

import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_model/calculations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

part 'cable_sizing_state.dart';

class CableSizingCubit extends Cubit<CableSizingState> {
  CableSizingCubit() : super(CableSizingInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScreenshotController screenshotController = ScreenshotController();
  Map<String, TextEditingController> inputParameters = {
    "System Type": TextEditingController(),
    "Fault Current": TextEditingController(),
    "Fault Duration (t)": TextEditingController(),
    "Conductor Material": TextEditingController(),
    "Max. Permissible Temperature T2": TextEditingController(),
    "Ambient Temperature T1": TextEditingController(),
  };

  CalculationsModel calculationsModel = CalculationsModel();
  late List<double> results = [
    ?calculationsModel.materialCoefficient,
    ?calculationsModel.standardCableSize,
  ];

  double? calculateMaterialCoefficient() {
    double? t2 = double.tryParse(
      inputParameters["Max. Permissible Temperature t2"]!.text,
    );
    double? t1 = double.tryParse(
      inputParameters["Ambient Temperature t1"]!.text,
    );
    final ratio = (t2! + 234.5) / (t1! + 234.5);
    if (log(ratio) < 0) {
      calculationsModel.materialCoefficient = 0;
    } else {
      calculationsModel.materialCoefficient =
          226 * sqrt(log((t2 + 234.5) / (t1 + 234.5)));
    }

    emit(CalculateCoefficientState());
    return calculationsModel.materialCoefficient;
  }

  void calculateArea() {
    double? faultCurrent = double.tryParse(
      inputParameters["Fault Current"]!.text,
    );
    double? faultDuration = double.tryParse(
      inputParameters["Fault Duration (t)"]!.text,
    );
    double? materialCoefficient = calculateMaterialCoefficient();
    double area =
        ((faultCurrent! * sqrt(faultDuration!)) / materialCoefficient!);
    double toleranceArea = area * 1.10;

    calculationsModel.requiredCrossSectionalArea = toleranceArea;
    calculationsModel.standardCableSize = getStandardCableSize(
      CalculationConstants.standardMeasures,
      calculationsModel.requiredCrossSectionalArea!,
    );
    emit(CalculateAreaState());
  }

  double getStandardCableSize(List<double> numbers, double result) {
    return numbers.reduce(
      (a, b) => (a - result).abs() < (b - result).abs() ? a : b,
    );
  }
}
