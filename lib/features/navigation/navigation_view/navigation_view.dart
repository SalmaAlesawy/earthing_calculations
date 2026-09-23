import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/navigation/navigation_view_model/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  icon: Icon(Icons.home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.assignment_outlined),
                  label: "Tests",
                  semanticsLabel: "Tests",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.description_outlined),
                  label: "Reports",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: "profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calculate_outlined),
                  label: "Calculations",
                ),
              ],
            ),
          ),
          body: navigationCubit.screens[navigationCubit.currentIndex],
        );
      },
    );
  }
}
