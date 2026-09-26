import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.soilResistivity,
    required this.rodLength,
    required this.rodDiameter,
    required this.rodMaterial,
  });
  final String soilResistivity;
  final String rodLength;
  final String rodDiameter;
  final String rodMaterial;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsPalette.bordersColor),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Summary",
            style: textTheme.titleLarge?.copyWith(
              color: ColorsPalette.mainOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Soil Resistivity (p)",
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              Text("$soilResistivity  Ω⋅m", style: textTheme.titleSmall),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Text(
                "Rod Length (L)",
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              Text("$rodLength  m", style: textTheme.titleSmall),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Text(
                "Rod Diameter (d)",
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              Text("$rodDiameter  m", style: textTheme.titleSmall),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Rod Material",
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              Text(rodMaterial, style: textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
