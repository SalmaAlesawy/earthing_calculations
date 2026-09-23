import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_model/calculations_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cable_sizing_state.dart';

class CableSizingCubit extends Cubit<CableSizingState> {
  CableSizingCubit() : super(CableSizingInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> images = [
    Assets.images.k.keyName,
    Assets.images.a.keyName,
    Assets.images.connection.keyName,
  ];
  List<Map<String, TextEditingController>> inputParameters = [
    {"System Type": TextEditingController()},
    {"Fault Current": TextEditingController()},
    {"Fault Duration (t)": TextEditingController()},
    {"Conductor Material": TextEditingController()},
    {"Max. Permissible Temperature T2": TextEditingController()},
    {"Ambient Temperature T1": TextEditingController()},
  ];
  CalculationsModel calculationsModel = CalculationsModel();
  List<Map<String, dynamic>> get summaryItems => [
    {
      "title": "Material Coefficient (K)",
      "value": calculationsModel.materialCoefficient?.toStringAsFixed(2),
    },
    {
      "title": "Required Cross Sectional Area (A)",
      "value": calculationsModel.requiredCrossSectionalArea?.toStringAsFixed(2),
    },
    {
      "title": "Standard Cable Size (Selected)",
      "value": calculationsModel.standardCableSize?.toStringAsFixed(2),
    },
  ];

  double? calculateMaterialCoefficient() {
    double? T2 = double.tryParse(inputParameters[4].values.first.text);
    double? T1 = double.tryParse(inputParameters[5].values.first.text);
    final ratio = (T2! + 234.5) / (T1! + 234.5);
    if (log(ratio) < 0) {
      calculationsModel.materialCoefficient = 0;
    } else {
      calculationsModel.materialCoefficient =
          226 * sqrt(log((T2 + 234.5) / (T1 + 234.5)));
    }

    emit(CalculateCoefficientState());
    return calculationsModel.materialCoefficient;
  }

  void calculateArea() {
    double? faultCurrent = double.tryParse(
      inputParameters[1].values.first.text,
    );
    double? faultDuration = double.tryParse(
      inputParameters[2].values.first.text,
    );
    double? materialCoefficient = calculateMaterialCoefficient();
    double area =
        ((faultCurrent! * sqrt(faultDuration!)) / materialCoefficient!);
    double toleranceArea=area*1.10;

    calculationsModel.requiredCrossSectionalArea = toleranceArea;
    calculationsModel.standardCableSize = getStandardCableSize(
      CalculationConstants.standardMeasures,
      calculationsModel.requiredCrossSectionalArea!,
    );
    print("area: $area");
    print("tolerance: $toleranceArea");
    print("standardCableSize: ${calculationsModel.standardCableSize}");
    emit(CalculateAreaState());
  }


  double getStandardCableSize(List<double> numbers, double result) {
    return numbers.reduce(
      (a, b) => (a - result).abs() < (b - result).abs() ? a : b,
    );
  }
}
