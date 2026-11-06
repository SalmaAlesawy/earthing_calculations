import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/equation_details_card.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/cable_sizing_view_model/cable_sizing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class CableSizingResultsView extends StatelessWidget {
  final CableSizingCubit cableSizingCubit;
  const CableSizingResultsView({super.key, required this.cableSizingCubit});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Screenshot(
      controller: cableSizingCubit.screenshotController,
      child: Column(
        spacing: 10,
        children: [
          Text(
            CalculationConstants.titles["Cable Sizing"]!,
            style: textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorsPalette.buttonBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorsPalette.bordersColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CalculationConstants.equationsDetails[0]['title'],
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ...List.generate(2, (index) {
                      return Text(
                        "${CalculationConstants.materialConstant.keys.toList()[index]} = ${CalculationConstants.materialConstant.values.toList()[index]}",
                        style: textTheme.bodySmall,
                      );
                    }),
                    Text(
                      "T2 = ${cableSizingCubit.inputParameters["Max. Permissible Temperature T2"]!.text}",
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      "T1 = ${cableSizingCubit.inputParameters["Ambient Temperature T1"]!.text}",
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsPalette.bordersColor),
                  ),
                ),
                Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CalculationConstants.equationsDetails[1]['title'],
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "I = ${cableSizingCubit.inputParameters["Fault Current"]!.text}",
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      "t = ${cableSizingCubit.inputParameters["Fault Duration (t)"]!.text}",
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      "K = ${cableSizingCubit.results[0].toStringAsFixed(2)}",
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsPalette.bordersColor),
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: ColorsPalette.buttonBackground,
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Calculation Steps",
                      style: textTheme.titleLarge?.copyWith(
                        color: ColorsPalette.buttonsOrange,
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return EquationDetailsCard(
                            image: CalculationConstants
                                .equationsDetails[index]["image"],
                            length: CalculationConstants
                                .equationsDetails[index]['details']
                                .length,
                            data: CalculationConstants
                                .equationsDetails[index]["details"]
                                .entries
                                .map<String>((entry) {
                                  return "${entry.key}: ${entry.value}";
                                })
                                .toList(),
                            title: CalculationConstants
                                .equationsDetails[index]['title'],
                            result: cableSizingCubit.results[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                        itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
