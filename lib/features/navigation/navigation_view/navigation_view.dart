import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_view_model/site_info_cubit.dart';
import 'package:earthing_calc/features/navigation/navigation_view_model/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            NavigationCubit navigationCubit = context.read<NavigationCubit>();
            return Scaffold(
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  onTap: (index) {
                    navigationCubit.changeScreen(index);
                    if (index == 1) {
                      context.read<SiteInfoCubit>().getProjects();
                    }
                  },
                  currentIndex: navigationCubit.currentIndex,
                  backgroundColor: Colors.transparent,
                  showUnselectedLabels: true,
                  selectedItemColor: ColorsPalette.mainOrange,
                  unselectedItemColor: ColorsPalette.white,
                  selectedFontSize: 16,
                  iconSize: 30,
                  useLegacyColorScheme: false,
                  enableFeedback: false,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.assignment_outlined),
                      label: "Projects",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calculate_outlined),
                      label: "Calculations",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.cast_for_education),
                      label: "Education",
                    ),

                    BottomNavigationBarItem(
                      icon: Icon(Icons.contact_page),
                      label: "Contact Us",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: "profile",
                    ),
                  ],
                ),
              ),
              body: navigationCubit.screens[navigationCubit.currentIndex],
            );
          },
        );
      },
    );
  }
}
