import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/widgets/summary_card.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/single_earth_rod_view_model/single_earth_rod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../calculations_constants/calculation_constants.dart';

class SingleRodResultView extends StatelessWidget {
  const SingleRodResultView({super.key, required this.singleEarthRodCubit});
  final SingleEarthRodCubit singleEarthRodCubit;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Screenshot(
      controller: singleEarthRodCubit.screenshotController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            CalculationConstants.titles["Single Earth Rod"]!,
            style: textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Assets.images.singleEarthRodFormula.image(
              color: Colors.white,
            ),
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
                  "${singleEarthRodCubit.singleRodResistance?.toStringAsFixed(2)} Ω",
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
          Text(
            "Summary",
            style: textTheme.titleLarge?.copyWith(
              color: ColorsPalette.mainOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          SummaryCard(
            length: singleEarthRodCubit.singleRodControllers.length,
            title: singleEarthRodCubit.singleRodControllers.keys.toList(),
            values: singleEarthRodCubit.singleRodControllers.values
                .map((controller) => controller.text)
                .toList(),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorsPalette.bordersColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Assets.images.singleResult.image(),
          ),
        ],
      ),
    );
  }
}
