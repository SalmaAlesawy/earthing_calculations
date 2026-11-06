import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/widgets/summary_card.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/multiple_earth_rod_view_model/multiple_earth_rod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../calculations_constants/calculation_constants.dart';

class MultipleRodsResultsView extends StatelessWidget {
  const MultipleRodsResultsView({
    super.key,
    required this.multipleEarthRodCubit,
  });
  final MultipleEarthRodCubit multipleEarthRodCubit;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Screenshot(
      controller: multipleEarthRodCubit.screenshotController,
      child: Column(
        children: [
          Text(
            CalculationConstants.titles["Multiple Earth Rods"]!,
            style: textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsPalette.bordersColor),
            ),
            child: Column(
              children: [
                Row(
                  spacing: 30,
                  children: [
                    Assets.images.correct.image(width: 50),
                    Text(
                      "Result",
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${multipleEarthRodCubit.multipleRodResistance?.toStringAsFixed(2)} Ω",
                  style: textTheme.bodyLarge?.copyWith(
                    color: ColorsPalette.mainOrange,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Earth Resistance",
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 15,
                    color: ColorsPalette.grayText,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Assets.images.multipleRodsFormula.image(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsPalette.bordersColor),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text(
                      "Group factor",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${multipleEarthRodCubit.groupFactor?.toStringAsFixed(2)} ",
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
                Divider(),
                SummaryCard(
                  length: multipleEarthRodCubit.multipleRodsControllers.length,
                  title: multipleEarthRodCubit.multipleRodsControllers.keys
                      .toList(),
                  values: multipleEarthRodCubit.multipleRodsControllers.values
                      .map((controller) => controller.text)
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
