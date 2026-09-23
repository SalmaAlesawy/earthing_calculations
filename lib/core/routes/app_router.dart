import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/features/authentication/login_feature/login_view/login_view.dart';
import 'package:earthing_calc/features/authentication/login_feature/login_view_model/login_cubit/login_cubit.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view/register_view.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view_model/register_cubit/register_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/cabel_sizing_view/cable_sizing_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/cable_sizing_view_model/cable_sizing_cubit.dart';
import 'package:earthing_calc/features/navigation/navigation_view/navigation_view.dart';
import 'package:earthing_calc/features/navigation/navigation_view_model/navigation_cubit.dart';
import 'package:earthing_calc/features/onboarding_feature/onboarding_view.dart';
import 'package:earthing_calc/features/tests_features/new_soil_test_feature/new_soil_test_view/new_soil_test_view.dart';
import 'package:earthing_calc/features/tests_features/new_soil_test_feature/new_soil_test_view_model/new_soil_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
          settings: setting,
        );
      case PageRouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginView(),
          ),
          settings: setting,
        );
      case PageRouteNames.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: RegisterView(),
          ),
          settings: setting,
        );
      case PageRouteNames.navigationScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NavigationCubit(),
            child: NavigationView(),
          ),
          settings: setting,
        );
      case PageRouteNames.newSoilTestScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NewSoilTestCubit(),
            child: NewSoilTestView(),
          ),
          settings: setting,
        );
      case PageRouteNames.cableSizingScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CableSizingCubit(),
            child: CableSizingView(),
          ),
          settings: setting,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
          settings: setting,
        );
    }
  }
}
