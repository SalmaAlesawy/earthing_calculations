import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/tests_features/new_soil_test_feature/new_soil_test_view_model/new_soil_test_cubit.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSoilTestView extends StatelessWidget {
  const NewSoilTestView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: BlocBuilder<NewSoilTestCubit, NewSoilTestState>(
  builder: (context, state) {
    NewSoilTestCubit soilTestCubit = context.read<NewSoilTestCubit>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            soilTestCubit.appBarTitles[soilTestCubit.currentIndex],
            style: textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: ColorsPalette.white),
          ),
        ),
        body: Column(
            children: [
              EasyStepper(
                stepRadius: 25,
                stepBorderRadius: 16,
                activeStepBackgroundColor: ColorsPalette.mainOrange,
                activeStepIconColor: ColorsPalette.white,
                activeStepTextColor: Colors.white,
                titleTextStyle: TextStyle(color: Colors.grey),
                unreachedStepTextColor: ColorsPalette.white,
                showLoadingAnimation: false,
                enableStepTapping: true,
                finishedStepTextColor: Colors.white,
                finishedStepIconColor: ColorsPalette.white,
                fitWidth: true,
                finishedStepBackgroundColor: ColorsPalette.green,
                unreachedStepBackgroundColor: Colors.blueGrey,
                unreachedStepIconColor: ColorsPalette.white,
                lineStyle: LineStyle(
                  lineLength: 60,
                  lineType: LineType.normal,
                  lineThickness: 1,
                  defaultLineColor: ColorsPalette.grayText,
                  finishedLineColor: ColorsPalette.green,
                ),
                activeStep: soilTestCubit.currentIndex,
                onStepReached: soilTestCubit.onStepClicked,
                steps: [
                  EasyStep(
                    title: "Site info",
                    finishIcon: Icon(Icons.done_sharp),
                    customStep: Assets.icons.counter1.svg(),
                  ),
                  EasyStep(
                    title: "Measurements",
                    finishIcon: Icon(Icons.done),
                    customStep: Assets.icons.counter2.svg(),
                  ),
                  EasyStep(
                    title: "Results",
                    finishIcon: Icon(Icons.done),
                    customStep: Assets.icons.counter3.svg(),
                  ),
                  EasyStep(
                    title: "Reports",
                    finishIcon: Icon(Icons.done),
                    customStep: Assets.icons.counter4.svg(),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: soilTestCubit.pages[soilTestCubit.currentIndex],
                  ),
                ),
              ),
            ],
        ),
      );
  },
),
    );
  }
}
