import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

part 'single_earth_rod_state.dart';

class SingleEarthRodCubit extends Cubit<SingleEarthRodState> {
  SingleEarthRodCubit() : super(SingleEarthRodInitial());
  ScreenshotController screenshotController = ScreenshotController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, TextEditingController> singleRodControllers = {
    "soil Resistivity": TextEditingController(),
    "rod Length": TextEditingController(),
    "rod Diameter": TextEditingController(),
    "rod Material": TextEditingController(),
  };
  double? singleRodResistance;

  void calculateSingleRodResistance() {
    double? rho = double.tryParse(
      singleRodControllers["soil Resistivity"]!.text,
    );
    double? length = double.tryParse(singleRodControllers["rod Length"]!.text);
    double? diameter = double.tryParse(
      singleRodControllers["rod Diameter"]!.text,
    );
    singleRodResistance =
        (rho! / (2 * pi * length!)) * (log(((8 * length) / diameter!)) - 1);
    emit(CalculateSingleRodResistanceState());
  }
}
