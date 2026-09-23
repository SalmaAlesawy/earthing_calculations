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
      onTap: () {
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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: ColorsPalette.white),
              ),
            ),
            body: Column(
              children: [
                EasyStepper(
                  stepRadius: 20,
                  activeStepBackgroundColor: ColorsPalette.buttonsOrange,
                  activeStepTextColor: Colors.white,
                  unreachedStepTextColor: ColorsPalette.white,
                  showLoadingAnimation: false,
                  finishedStepTextColor: ColorsPalette.green,
                  fitWidth: true,
                  finishedStepBackgroundColor: ColorsPalette.green,
                  unreachedStepBackgroundColor: Colors.blueGrey,
                  lineStyle: LineStyle(
                    lineLength: 60,
                    lineType: LineType.dashed,
                    lineThickness: 1,
                    defaultLineColor: ColorsPalette.grayText,
                    finishedLineColor: ColorsPalette.green,
                  ),
                  activeStep: soilTestCubit.currentIndex,

                  steps: [
                    EasyStep(
                      title: "Site info",
                      finishIcon: Icon(Icons.done_sharp),
                      customStep: soilTestCubit.currentIndex > 0
                          ? Icon(Icons.done,size: 35,)
                          :Assets.icons.counter1.svg(),
                    ),
                    EasyStep(
                      title: "Measurements",
                      customStep: soilTestCubit.currentIndex > 1
                          ? Icon(Icons.done,size: 35)
                          : Assets.icons.counter2.svg(),
                    ),
                    EasyStep(
                      title: "Results",
                      customStep:soilTestCubit.currentIndex > 2
                          ? Icon(Icons.done,size: 35)
                          : Assets.icons.counter3.svg(),
                    ),
                    EasyStep(
                      title: "Reports",
                      customStep:soilTestCubit.currentIndex > 3
                          ? Icon(Icons.done,size: 35)
                          : Assets.icons.counter4.svg(),
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
