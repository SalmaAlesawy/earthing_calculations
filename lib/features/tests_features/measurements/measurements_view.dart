
import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_button.dart';
import 'package:earthing_calc/features/tests_features/measurements/measurements_view_model/measurements_cubit.dart';
import 'package:earthing_calc/features/tests_features/new_soil_test_feature/new_soil_test_view_model/new_soil_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementsView extends StatelessWidget {
  const MeasurementsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocBuilder<MeasurementsCubit, MeasurementsState>(
        builder: (context, state) {
          MeasurementsCubit measurementsCubit = context
              .read<MeasurementsCubit>();
          return Form(
            key: measurementsCubit.formKey,
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.images.winner4Pins.image(),
                DropdownButtonFormField<List<double>>(
                  dropdownColor: ColorsPalette.buttonBackground,
                  decoration: InputDecoration(
                    labelText: "Probe Spacing (a)",
                    labelStyle: TextStyle(
                      color: ColorsPalette.white,
                      fontSize: 20,
                    ),
                    hintText: "choose one",
                    hintStyle: TextStyle(color: ColorsPalette.bordersColor),
                    fillColor: ColorsPalette.buttonBackground,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorsPalette.bordersColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorsPalette.bordersColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorsPalette.bordersColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorsPalette.bordersColor),
                    ),
                  ),
                  items: measurementsCubit.probeSpacing.map((value) {
                    return DropdownMenuItem<List<double>>(
                      value: value,
                      child: Text("$value"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      measurementsCubit.onSelectSpace(value);
                    }
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Resistance Readings (R)",
                  style: textTheme.bodyMedium?.copyWith(
                    color: ColorsPalette.white,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    itemCount: measurementsCubit.points,
                    separatorBuilder: (context, pointIndex) {
                      return SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int pontIndex) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsPalette.buttonBackground,
                          border: Border.all(color: ColorsPalette.bordersColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "point ${pontIndex + 1}",
                              style: textTheme.titleLarge,
                            ),
                            ListView.separated(
                              separatorBuilder: (context, resistanceIndex) {
                                return SizedBox(height: 10);
                              },
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, resistanceIndex) {
                                return Row(
                                  children: [
                                    Text(
                                      "R ${resistanceIndex + 1}",
                                      style: textTheme.titleSmall?.copyWith(
                                        color: ColorsPalette.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.13,
                                    ),
                                    Expanded(
                                      child: Custemtextformfield(
                                        validator: (value) =>
                                            Validators.validateNumber(
                                              value,
                                              "R${resistanceIndex + 1}",
                                            ),
                                        controller: measurementsCubit
                                            .resistanceControllers[pontIndex][resistanceIndex],
                                        hintText: "${resistanceIndex + 10.13}",
                                        obscureText: false,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: ColorsPalette.bordersColor,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          pontIndex <
                                                      measurementsCubit
                                                          .allSoilResistivity
                                                          .length &&
                                                  resistanceIndex <
                                                      measurementsCubit
                                                          .allSoilResistivity[pontIndex]
                                                          .length
                                              ? measurementsCubit
                                                    .allSoilResistivity[pontIndex][resistanceIndex]
                                                    .toStringAsFixed(1)
                                              : "",
                                          style: textTheme.titleMedium,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorsPalette.cardColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    textBaseline: TextBaseline.ideographic,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Average Soil Resistivity: ${pontIndex < measurementsCubit.averagePoints.length ? measurementsCubit.averagePoints[pontIndex].toStringAsFixed(1) : ""} ",
                                        style: textTheme.titleLarge?.copyWith(
                                          color: ColorsPalette.buttonsOrange,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        measurementsCubit.averagePoints.isEmpty
                                            ? ""
                                            : "Ω.m",
                                        style: textTheme.titleLarge?.copyWith(
                                          color: ColorsPalette.buttonsOrange,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      textButton: "Add More",
                      onPressed: () {
                        measurementsCubit.addMore();
                      },
                    ),
                    CustomTextButton(
                      textButton: "reduce one",
                      onPressed: () {
                        measurementsCubit.delete();
                      },
                    ),
                  ],
                ),
                BlocBuilder<NewSoilTestCubit, NewSoilTestState>(
                  builder: (context, state) {
                    NewSoilTestCubit newSoilTestCubit = context
                        .read<NewSoilTestCubit>();
                    return Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Customelevatedbutton(
                            backGroundColor: WidgetStatePropertyAll(
                              Colors.black26,
                            ),
                            buttonText: "Back",
                            onPressed: () {
                              newSoilTestCubit.prevStep();
                            },
                          ),
                        ),

                        measurementsCubit.finalAverage == null
                            ? Expanded(
                                child: Customelevatedbutton(
                                  borderColor: ColorsPalette.buttonsOrange,
                                  backGroundColor: WidgetStatePropertyAll(
                                    ColorsPalette.buttonsOrange,
                                  ),
                                  buttonText: "Calculate",
                                  onPressed: () {
                                    if (measurementsCubit.formKey.currentState!
                                        .validate()) {
                                      measurementsCubit.allSoilResistivity =
                                          List.generate(
                                            measurementsCubit
                                                .resistanceControllers
                                                .length,
                                            (_) => [],
                                          );
                                      measurementsCubit.averagePoints.clear();
                                      for (
                                        int pointIndex = 0;
                                        pointIndex <
                                            measurementsCubit
                                                .resistanceControllers
                                                .length;
                                        pointIndex++
                                      ) {
                                        for (
                                          int resistanceIndex = 0;
                                          resistanceIndex <
                                              measurementsCubit
                                                  .resistanceControllers[pointIndex]
                                                  .length;
                                          resistanceIndex++
                                        ) {
                                          measurementsCubit.calculations(
                                            measurementsCubit
                                                .resistanceControllers[pointIndex][resistanceIndex]
                                                .text,
                                            measurementsCubit
                                                .selectedSpacing![resistanceIndex],
                                            pointIndex,
                                          );
                                        }
                                        measurementsCubit.calculatePointAverage(
                                          pointIndex,
                                        );
                                      }
                                      measurementsCubit.calculateFinalAverage();
                                    }
                                  },
                                ),
                              )
                            : Expanded(
                                child: Customelevatedbutton(
                                  borderColor: ColorsPalette.buttonsOrange,
                                  backGroundColor: WidgetStatePropertyAll(
                                    ColorsPalette.buttonsOrange,
                                  ),
                                  buttonText: "Next",
                                  onPressed: () {
                                    newSoilTestCubit.nextStep();
                                  },
                                ),
                              ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
