import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

part 'multiple_earth_rod_state.dart';

class MultipleEarthRodCubit extends Cubit<MultipleEarthRodState> {
  MultipleEarthRodCubit() : super(MultipleEarthRodInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScreenshotController screenshotController = ScreenshotController();
  Map<String, TextEditingController> multipleRodsControllers = {
    "Number of rods(n)": TextEditingController(),
    "Soil resistivity(p)": TextEditingController(),
    "Rod length(L)": TextEditingController(),
    "Rod diameter(d)": TextEditingController(),
    "spacing(s)": TextEditingController(),
  };
  double? groupFactor;
  double? multipleRodResistance;
  double? calculateGroupFactor(int numberOfRods) {
    double sum = 0.0;
    for (int i = 2; i <= numberOfRods; i++) {
      sum += 1 / i;
    }
    groupFactor = 2 * sum;
    emit(GroupFactorState());
    return groupFactor;
  }

  void calculateMultipleRodResistance() {
    int? numberOfRods = int.tryParse(
      multipleRodsControllers["Number of rods(n)"]!.text,
    );
    double? soilResistivity = double.tryParse(
      multipleRodsControllers["Soil resistivity(p)"]!.text,
    );
    double? rodLength = double.tryParse(
      multipleRodsControllers["Rod length(L)"]!.text,
    );
    double? rodDiameter = double.tryParse(
      multipleRodsControllers["Rod diameter(d)"]!.text,
    );
    double? spacing = double.tryParse(
      multipleRodsControllers["spacing(s)"]!.text,
    );

    multipleRodResistance =
        (1 / numberOfRods!) *
        (soilResistivity! / (2 * pi * rodLength!)) *
        (log((8 * rodLength) / rodDiameter!) -
            1 +
            ((calculateGroupFactor(numberOfRods)! * rodLength) / spacing!));
    emit(MultipleEarthResistanceState());
  }
}
