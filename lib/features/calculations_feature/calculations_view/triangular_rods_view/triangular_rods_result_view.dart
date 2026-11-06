import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/widgets/summary_card.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/triangular_rod_system_view_model/triangular_rod_system_cubit.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../calculations_constants/calculation_constants.dart';

class TriangularRodsResultView extends StatelessWidget {
  const TriangularRodsResultView({
    super.key,
    required this.triangularRodSystemCubit,
  });
  final TriangularRodSystemCubit triangularRodSystemCubit;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Screenshot(
      controller: triangularRodSystemCubit.screenshotController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CalculationConstants.titles["Triangular Rod System"]!,
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
                  "${triangularRodSystemCubit.triangularResistance?.toStringAsFixed(2)} Ω",
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
          Text(
            "Summary",
            style: textTheme.titleLarge?.copyWith(
              color: ColorsPalette.mainOrange,
              fontWeight: FontWeight.bold,
            ),
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
                SummaryCard(
                  length:
                      triangularRodSystemCubit.triangularRodControllers.length,
                  title: triangularRodSystemCubit.triangularRodControllers.keys
                      .toList(),
                  values: triangularRodSystemCubit
                      .triangularRodControllers
                      .values
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
