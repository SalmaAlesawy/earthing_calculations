import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthing_calc/features/reports_features/reports_view/reports_view.dart';
import 'package:earthing_calc/features/tests_features/measurements/measurements_view.dart';
import 'package:earthing_calc/features/tests_features/measurements/measurements_view_model/measurements_cubit.dart';
import 'package:earthing_calc/features/tests_features/results/results_view.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_model/site_info_repository.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_view/site_info_view.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_view_model/site_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'new_soil_test_state.dart';

class NewSoilTestCubit extends Cubit<NewSoilTestState> {
  NewSoilTestCubit() : super(NewSoilTestInitial());
  int currentIndex = 0;
  List<Widget> pages = [
    BlocProvider(
      create: (context) =>
          SiteInfoCubit(
            repository: SiteInfoRepository(FirebaseFirestore.instance),
          ),
      child: SiteInfoView(),
    ),
    BlocProvider(
      create: (context) => MeasurementsCubit(),
      child: MeasurementsView(),
    ),
    BlocProvider(
      create: (context) => MeasurementsCubit(),
      child: ResultsView(averageR: 10, probeSpacing: 20, soilResistivity: 10,),
    ),
    ReportsView(),
  ];
  List<String> appBarTitles = [
    "New Soil Test",
    "Winner Measurement",
    "Calculation (p)",
    "Directional Resistivity",
  ];

  void onStepClicked(int index) {
    currentIndex = index;
    print(currentIndex);
    emit(NewTestStepChangedState(currentIndex));
  }

  void nextStep({List<double>? parameters}) {
    currentIndex++;
    print(currentIndex);
    emit(NewTestStepChangedState(currentIndex));
  }

  void prevStep() {
    currentIndex--;
    emit(NewTestStepChangedState(currentIndex));
  }
}
