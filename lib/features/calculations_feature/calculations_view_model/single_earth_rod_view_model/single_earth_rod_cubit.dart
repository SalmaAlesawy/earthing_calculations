import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'single_earth_rod_state.dart';

class SingleEarthRodCubit extends Cubit<SingleEarthRodState> {
  SingleEarthRodCubit() : super(SingleEarthRodInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController soilResistivityController = TextEditingController();
  TextEditingController rodLengthController = TextEditingController();
  TextEditingController rodDiameterController = TextEditingController();
  TextEditingController rodMaterialController = TextEditingController();
  double? singleRodResistance;

  void calculateSingleRodResistance() {
    double? rho = double.tryParse(soilResistivityController.text);
    double? length = double.tryParse(rodLengthController.text);
    double? diameter = double.tryParse(rodDiameterController.text);
    singleRodResistance =
        (rho! / (2 * pi * length!)) * (log(((8 * length) / diameter!))-1);
    print(singleRodResistance);
    emit(CalculateSingleRodResistanceState());
  }
}
