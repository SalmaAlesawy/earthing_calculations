
import 'package:bloc/bloc.dart';
import 'package:earthing_calc/features/home_features/home_view/home_view.dart';
import 'package:earthing_calc/features/profile_features/profile_view/profile_view.dart';
import 'package:earthing_calc/features/reports_features/reports_view/reports_view.dart';
import 'package:earthing_calc/features/tests_features/tests_view/tests_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  int currentIndex=0;
  List<Widget> screens=[
    HomeView(),
    TestsView(),
    ReportsView(),
    ProfileView()
  ];
  void changeScreen(int index){
    currentIndex=index;
   emit(NavigationInitial());
  }
}
