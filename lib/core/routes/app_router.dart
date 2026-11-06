import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/features/authentication/login_feature/login_view/login_view.dart';
import 'package:earthing_calc/features/authentication/login_feature/login_view_model/login_cubit/login_cubit.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view/register_view.dart';
import 'package:earthing_calc/features/authentication/register_feature/register_view_model/register_cubit/register_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/Calculations_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/cabel_sizing_view/cable_sizing_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/multiple_rods_view/multiple_rods_veiw.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/single_rod_view/single_rod_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/soil_resistivity_view/soil_resistivity_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/triangular_rods_view/triangular_rods_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/cable_sizing_view_model/cable_sizing_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/multiple_earth_rod_view_model/multiple_earth_rod_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/single_earth_rod_view_model/single_earth_rod_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/soil_resistivity_view_model/soil_resistivity_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/triangular_rod_system_view_model/triangular_rod_system_cubit.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_view/site_info_view.dart';
import 'package:earthing_calc/features/navigation/navigation_view/navigation_view.dart';
import 'package:earthing_calc/features/navigation/navigation_view_model/navigation_cubit.dart';
import 'package:earthing_calc/features/onboarding_feature/onboarding_view.dart';
import 'package:earthing_calc/features/projects_features/projects_view/projects_view.dart';
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
      case PageRouteNames.calculationsScreen:
        return MaterialPageRoute(
          builder: (context) => CalculationsView(),
          settings: setting,
        );
      case PageRouteNames.projectScreen:
        return MaterialPageRoute(
          builder: (context) => ProjectView(),
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
      case PageRouteNames.soilResistivityScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SoilResistivityCubit()),
            ],
            child: SoilResistivityCalcView(),
          ),
          settings: setting,
        );
      case PageRouteNames.projectInfoScreen:
        return MaterialPageRoute(
          builder: (context) => SiteInfoView(),
          settings: setting,
        );
      case PageRouteNames.cableSizingScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => CableSizingCubit())],
            child: CableSizingView(),
          ),
          settings: setting,
        );
      case PageRouteNames.singleRodScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SingleEarthRodCubit()),
            ],
            child: SingleRodView(),
          ),
          settings: setting,
        );
      case PageRouteNames.multipleRodsScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MultipleEarthRodCubit()),
            ],
            child: MultipleRodsView(),
          ),
          settings: setting,
        );
      case PageRouteNames.triangularRodScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => TriangularRodSystemCubit()),
            ],
            child: TriangularRodsView(),
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
