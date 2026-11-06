import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class EquationDetailsCard extends StatelessWidget {
  const EquationDetailsCard({
    super.key,
    required this.image,
    required this.length,
    required this.data,
    required this.title,
    required this.result,
  });
  final String title;
  final String image;
  final int length;
  final double result;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsPalette.bordersColor),
        color: ColorsPalette.buttonBackground,
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.asset(
              image,
              width: 200,
              height: 70,
              fit: BoxFit.cover,
              color: ColorsPalette.white,
            ),
          ),
          ...List.generate(length, ((index) {
            return Text(data[index], style: textTheme.titleSmall);
          })),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsPalette.resultsBorders),
              borderRadius: BorderRadiusGeometry.circular(12),
              color: ColorsPalette.darkBlue,
            ),
            child: Row(
              children: [
                Assets.icons.calculatorIcon.svg(width: 25),
                VerticalDivider(
                  color: ColorsPalette.bordersColor,
                  thickness: 5,
                  indent: 5,
                ),
                Text(title, style: textTheme.titleLarge),
                SizedBox(width: 30,),
                // VerticalDivider(
                //   color: ColorsPalette.bordersColor,
                //   thickness: 5,
                //   indent: 5,
                // ),
                Text(
                  result.toStringAsFixed(2),
                  style: textTheme.titleLarge?.copyWith(
                    color: ColorsPalette.brightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
