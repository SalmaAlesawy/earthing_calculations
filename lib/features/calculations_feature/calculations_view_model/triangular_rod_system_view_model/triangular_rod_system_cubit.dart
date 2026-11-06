import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

part 'triangular_rod_system_state.dart';

class TriangularRodSystemCubit extends Cubit<TriangularRodSystemState> {
  TriangularRodSystemCubit() : super(TriangularRodSystemInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScreenshotController screenshotController = ScreenshotController();
  Map<String, TextEditingController> triangularRodControllers = {
    "Soil Resistivity": TextEditingController(),
    "Rod length": TextEditingController(),
    "Rod diameter": TextEditingController(),
    "Triangular side": TextEditingController(),
  };

  double? triangularResistance;
  void calculateTriangularResistance() {
    double? soilResistivity = double.tryParse(
      triangularRodControllers["Soil Resistivity"]!.text,
    );
    double? rodLength = double.tryParse(
      triangularRodControllers["Rod length"]!.text,
    );
    double? rodDiameter = double.tryParse(
      triangularRodControllers["Rod diameter"]!.text,
    );
    double? triangularSide = double.tryParse(
      triangularRodControllers["Triangular side"]!.text,
    );
    triangularResistance =
        (1 / 3) *
        (soilResistivity! / (2 * pi * rodLength!)) *
        (log((8 * rodLength) / rodDiameter!) -
            1 +
            ((2 * rodLength) / triangularSide!));
    emit(TriangularRodResistanceState());
  }
}
