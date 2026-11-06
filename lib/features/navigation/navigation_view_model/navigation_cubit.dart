import 'package:earthing_calc/features/calculations_feature/calculations_view/Calculations_view.dart';
import 'package:earthing_calc/features/contact_us_features/contact_us_view/contact_us_view.dart';
import 'package:earthing_calc/features/contact_us_features/contact_us_view_model/contact_us_cubit.dart';
import 'package:earthing_calc/features/education_feature/education_view_model/education_cubit.dart';
import 'package:earthing_calc/features/profile_features/profile_view/profile_view.dart';
import 'package:earthing_calc/features/projects_features/projects_view/projects_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../education_feature/education_view.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  int currentIndex = 0;
  List<Widget> screens = [
    ProjectView(),
    CalculationsView(),
    BlocProvider(create: (context) => EducationCubit(), child: EducationView()),
    BlocProvider(create: (context) => ContactUsCubit(), child: ContactUsView()),
    ProfileView(),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(NavigationInitial());
  }
}
