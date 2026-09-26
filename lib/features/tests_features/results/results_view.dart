import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/features/tests_features/measurements/measurements_view_model/measurements_cubit.dart';
import 'package:earthing_calc/features/tests_features/new_soil_test_feature/new_soil_test_view_model/new_soil_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({
    super.key,
    required this.probeSpacing,
    required this.averageR,
    required this.soilResistivity,
  });
  final double probeSpacing;
  final double averageR;
  final double soilResistivity;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<MeasurementsCubit, MeasurementsState>(
      builder: (context, state) {
        MeasurementsCubit measurementsCubit = context.read<MeasurementsCubit>();
        return Column(
          children: [
            Assets.images.winnerFormula.image(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Probe Spacing (a)", style: textTheme.titleLarge),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsPalette.buttonBackground,
                          border: Border.all(color: ColorsPalette.bordersColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "${measurementsCubit.selectedSpacing.toString()} m",
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: ColorsPalette.buttonBackground,
                  border: Border.all(color: ColorsPalette.bordersColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  spacing: 39,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Soil Resistivity (p)",
                      style: textTheme.titleLarge?.copyWith(fontSize: 30),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${measurementsCubit.finalAverage?.toStringAsFixed(2)}",
                            style: textTheme.titleLarge?.copyWith(
                              color: ColorsPalette.mainOrange,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(child: SizedBox(width: 3)),
                          TextSpan(
                            text: "Ω.m",
                            style: textTheme.titleMedium?.copyWith(
                              color: ColorsPalette.mainOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BlocBuilder<NewSoilTestCubit, NewSoilTestState>(
                      builder: (context, state) {
                        NewSoilTestCubit newSoilTestCubit = context
                            .read<NewSoilTestCubit>();
                        return Customelevatedbutton(
                          backGroundColor: WidgetStatePropertyAll(
                            Colors.black26,
                          ),
                          buttonText: "Back",
                          onPressed: () {
                            newSoilTestCubit.prevStep();
                          },
                        );
                      },
                    ),
                  ),

                  Expanded(
                    child: Customelevatedbutton(
                      borderColor: ColorsPalette.buttonsOrange,
                      backGroundColor: WidgetStatePropertyAll(
                        ColorsPalette.buttonsOrange,
                      ),
                      buttonText: "Next",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
