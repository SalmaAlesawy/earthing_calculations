import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'triangular_rod_system_state.dart';

class TriangularRodSystemCubit extends Cubit<TriangularRodSystemState> {
  TriangularRodSystemCubit() : super(TriangularRodSystemInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController soilResistivityController = TextEditingController();
  TextEditingController rodLengthController = TextEditingController();
  TextEditingController rodDiameterController = TextEditingController();
  TextEditingController triangularSideController = TextEditingController();
  double? triangularResistance;
  void calculateTriangularResistance() {
    double? soilResistivity = double.tryParse(soilResistivityController.text);
    double? rodLength = double.tryParse(rodLengthController.text);
    double? rodDiameter = double.tryParse(rodDiameterController.text);
    double? triangularSide = double.tryParse(triangularSideController.text);
    triangularResistance =
        (1 / 3) *
        (soilResistivity! / (2 * pi * rodLength!)) *
        (log((8 * rodLength) / rodDiameter!) -
            1 +
            ((2 * rodLength) / triangularSide!));
    print(triangularResistance);
    emit(TriangularRodResistanceState());
  }
}
