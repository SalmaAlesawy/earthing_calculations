import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/soil_resistivity_view_model/soil_resistivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({
    super.key,
    required this.resistances,
    required this.soilResistivityCubit,
  });
  final SoilResistivityCubit soilResistivityCubit;
  final List<List<TextEditingController>> resistances;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Screenshot(
      controller: soilResistivityCubit.screenshotController,
      child: Column(
        children: [
          Assets.images.wennerFormula.image(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
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
                          "${soilResistivityCubit.selectedSpacing} m",
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
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: soilResistivityCubit.averagePoints.length,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ColorsPalette.buttonBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "p${index + 1}= ",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                soilResistivityCubit.averagePoints[index]
                                    .toStringAsFixed(2),
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          ...List.generate(
                            resistances[index].length,
                            (rIndex) => Row(
                              children: [
                                Text(
                                  "R${rIndex + 1}= ",
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  resistances[index][rIndex].text,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 5),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
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
                          text: soilResistivityCubit.finalAverage!
                              .toStringAsFixed(2),
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
        ],
      ),
    );
  }
}
