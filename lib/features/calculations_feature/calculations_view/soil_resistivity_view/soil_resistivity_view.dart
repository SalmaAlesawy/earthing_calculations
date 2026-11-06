import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/shared_view_models/export_pdf_cubit/export_pdf_cubit.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/soil_resistivity_view/soil_resistivity_results_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/soil_resistivity_view_model/soil_resistivity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class SoilResistivityCalcView extends StatelessWidget {
  const SoilResistivityCalcView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
        ),
        title: Text(
          CalculationConstants.titles.keys.last,
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<SoilResistivityCubit, SoilResistivityState>(
          builder: (context, state) {
            SoilResistivityCubit soilResistivityCubit = context
                .read<SoilResistivityCubit>();
            return soilResistivityCubit.averagePoints.isEmpty
                ? Form(
                    key: soilResistivityCubit.formKey,
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.images.wenner4Pins.image(),
                        DropdownButtonFormField<List<double>>(
                          dropdownColor: ColorsPalette.buttonBackground,
                          validator: (value) {
                            if (value == null) {
                              return "This Field is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Probe Spacing (a)",
                            labelStyle: TextStyle(
                              color: ColorsPalette.white,
                              fontSize: 20,
                            ),
                            hintText: "choose one",
                            hintStyle: TextStyle(
                              color: ColorsPalette.bordersColor,
                            ),
                            fillColor: ColorsPalette.buttonBackground,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: ColorsPalette.bordersColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: ColorsPalette.bordersColor,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: ColorsPalette.bordersColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: ColorsPalette.bordersColor,
                              ),
                            ),
                          ),
                          items: soilResistivityCubit.probeSpacing.map((value) {
                            return DropdownMenuItem<List<double>>(
                              value: value,
                              child: Text("$value"),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              soilResistivityCubit.onSelectSpace(value);
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
                            itemCount: soilResistivityCubit.points,
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
                                  border: Border.all(
                                    color: ColorsPalette.bordersColor,
                                  ),
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
                                      separatorBuilder:
                                          (context, resistanceIndex) {
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
                                              style: textTheme.titleSmall
                                                  ?.copyWith(
                                                    color: ColorsPalette.white,
                                                  ),
                                            ),
                                            SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.13,
                                            ),
                                            Expanded(
                                              child: Custemtextformfield(
                                                validator: (value) =>
                                                    Validators.generalValidate(
                                                      value,
                                                      "R${resistanceIndex + 1}",
                                                    ),
                                                controller: soilResistivityCubit
                                                    .resistanceControllers[pontIndex][resistanceIndex],
                                                hintText:
                                                    "${resistanceIndex + 10.13}",
                                                obscureText: false,
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.black54,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: ColorsPalette
                                                      .bordersColor,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  pontIndex <
                                                              soilResistivityCubit
                                                                  .allSoilResistivity
                                                                  .length &&
                                                          resistanceIndex <
                                                              soilResistivityCubit
                                                                  .allSoilResistivity[pontIndex]
                                                                  .length
                                                      ? soilResistivityCubit
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
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            textBaseline:
                                                TextBaseline.ideographic,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Average Soil Resistivity: ${pontIndex < soilResistivityCubit.averagePoints.length ? soilResistivityCubit.averagePoints[pontIndex].toStringAsFixed(1) : ""} ",
                                                style: textTheme.titleLarge
                                                    ?.copyWith(
                                                      color: ColorsPalette
                                                          .buttonsOrange,
                                                      fontSize: 20,
                                                    ),
                                              ),
                                              Text(
                                                soilResistivityCubit
                                                        .averagePoints
                                                        .isEmpty
                                                    ? ""
                                                    : "Ω.m",
                                                style: textTheme.titleLarge
                                                    ?.copyWith(
                                                      color: ColorsPalette
                                                          .buttonsOrange,
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
                                soilResistivityCubit.addMore();
                              },
                            ),
                            CustomTextButton(
                              textButton: "reduce one",
                              onPressed: () {
                                soilResistivityCubit.delete();
                              },
                            ),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Customelevatedbutton(
                                backGroundColor: WidgetStatePropertyAll(
                                  Colors.black26,
                                ),
                                buttonText: "Back",
                                onPressed: () {},
                              ),
                            ),

                            soilResistivityCubit.finalAverage == null
                                ? Expanded(
                                    child: Customelevatedbutton(
                                      borderColor: ColorsPalette.buttonsOrange,
                                      backGroundColor: WidgetStatePropertyAll(
                                        ColorsPalette.buttonsOrange,
                                      ),
                                      buttonText: "Calculate",
                                      onPressed: () {
                                        if (soilResistivityCubit
                                            .formKey
                                            .currentState!
                                            .validate()) {
                                          soilResistivityCubit
                                                  .allSoilResistivity =
                                              List.generate(
                                                soilResistivityCubit
                                                    .resistanceControllers
                                                    .length,
                                                (_) => [],
                                              );
                                          soilResistivityCubit.averagePoints
                                              .clear();
                                          for (
                                            int pointIndex = 0;
                                            pointIndex <
                                                soilResistivityCubit
                                                    .resistanceControllers
                                                    .length;
                                            pointIndex++
                                          ) {
                                            for (
                                              int resistanceIndex = 0;
                                              resistanceIndex <
                                                  soilResistivityCubit
                                                      .resistanceControllers[pointIndex]
                                                      .length;
                                              resistanceIndex++
                                            ) {
                                              soilResistivityCubit.calculations(
                                                soilResistivityCubit
                                                    .resistanceControllers[pointIndex][resistanceIndex]
                                                    .text,
                                                soilResistivityCubit
                                                    .selectedSpacing![resistanceIndex],
                                                pointIndex,
                                              );
                                            }
                                            soilResistivityCubit
                                                .calculatePointAverage(
                                                  pointIndex,
                                                );
                                          }
                                          soilResistivityCubit
                                              .calculateFinalAverage();
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
                                      onPressed: () {},
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  )
                : BlocListener<ExportPdfCubit, ExportPdfState>(
                    listener: (context, state) async {
                      if (state is SuccessExportingPdfState) {
                        await Printing.layoutPdf(
                          onLayout: (_) async => state.pdfBytes,
                        );
                      }
                      if (state is ErrorExportingPdfState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ResultsView(
                          soilResistivityCubit: soilResistivityCubit,
                          resistances:
                              soilResistivityCubit.resistanceControllers,
                        ),
                        Customelevatedbutton(
                          buttonText: "Save As Pdf & Continue",
                          backGroundColor: WidgetStatePropertyAll(
                            ColorsPalette.buttonsOrange,
                          ),
                          onPressed: () {
                            context.read<ExportPdfCubit>().exportPdf(
                              controller:
                                  soilResistivityCubit.screenshotController,
                              context: context,
                              screenContent: ResultsView(
                                resistances:
                                    soilResistivityCubit.resistanceControllers,
                                soilResistivityCubit: soilResistivityCubit,
                              ),
                              title: CalculationConstants.titles.keys
                                  .toList()[4],
                            );
                          },
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
