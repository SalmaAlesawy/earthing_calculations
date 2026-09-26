import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'multiple_earth_rod_state.dart';

class MultipleEarthRodCubit extends Cubit<MultipleEarthRodState> {
  MultipleEarthRodCubit() : super(MultipleEarthRodInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController numberOfRodsController = TextEditingController();
  TextEditingController soilResistivityController = TextEditingController();
  TextEditingController rodLengthController = TextEditingController();
  TextEditingController rodDiameterController = TextEditingController();
  TextEditingController spacingController = TextEditingController();
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
    int? numberOfRods = int.tryParse(numberOfRodsController.text);
    double? soilResistivity = double.tryParse(soilResistivityController.text);
    double? rodLength = double.tryParse(rodLengthController.text);
    double? rodDiameter = double.tryParse(rodDiameterController.text);
    double? spacing = double.tryParse(spacingController.text);

     multipleRodResistance =
        (1 / numberOfRods!) *
        (soilResistivity! / (2 * pi * rodLength!)) *
        (log((8 * rodLength) / rodDiameter!) -
            1 +
            ((calculateGroupFactor(numberOfRods)! * rodLength) / spacing!));
    print(multipleRodResistance);
    emit(MultipleEarthResistanceState());
  }
}
