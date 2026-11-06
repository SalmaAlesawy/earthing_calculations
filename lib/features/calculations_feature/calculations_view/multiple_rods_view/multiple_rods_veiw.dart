import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/shared_view_models/export_pdf_cubit/export_pdf_cubit.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/multiple_rods_view/multible_rods_results_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/multiple_earth_rod_view_model/multiple_earth_rod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class MultipleRodsView extends StatelessWidget {
  const MultipleRodsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Earth Rods", style: textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
          color: ColorsPalette.white,
        ),
      ),
      body: BlocListener<ExportPdfCubit, ExportPdfState>(
        listener: (context, state) async {
          if (state is SuccessExportingPdfState) {
            await Printing.layoutPdf(onLayout: (_) async => state.pdfBytes);
          }
          if (state is ErrorExportingPdfState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MultipleEarthRodCubit, MultipleEarthRodState>(
            builder: (context, state) {
              MultipleEarthRodCubit multipleEarthRodCubit = context
                  .read<MultipleEarthRodCubit>();
              return multipleEarthRodCubit.multipleRodResistance == null
                  ? Form(
                      key: multipleEarthRodCubit.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Assets.images.multipleEarthRods.image(),

                            Container(
                              padding: EdgeInsets.all(16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(16),
                                border: Border.all(
                                  color: ColorsPalette.bordersColor,
                                ),
                              ),
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "INPUT PARAMETERS",
                                    style: textTheme.titleLarge?.copyWith(
                                      color: ColorsPalette.mainOrange,
                                    ),
                                  ),
                                  Text(
                                    "Number of Rods",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: ColorsPalette.white,
                                    ),
                                  ),
                                  Custemtextformfield(
                                    controller: multipleEarthRodCubit
                                        .multipleRodsControllers["Number of rods(n)"],
                                    validator: (value) {
                                      return Validators.validator(value);
                                    },
                                    hintText: "100",
                                    obscureText: false,
                                  ),
                                  Text(
                                    "Soil Resistivity (p)",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: ColorsPalette.white,
                                    ),
                                  ),
                                  Custemtextformfield(
                                    controller: multipleEarthRodCubit
                                        .multipleRodsControllers["Soil resistivity(p)"],
                                    validator: (value) {
                                      return Validators.validator(value);
                                    },
                                    hintText: "100",
                                    obscureText: false,
                                    suffixIcon: Text(
                                      "Ω·m",
                                      style: textTheme.titleSmall,
                                    ),
                                  ),
                                  Text(
                                    "Rod Length (L)",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: ColorsPalette.white,
                                    ),
                                  ),
                                  Custemtextformfield(
                                    controller: multipleEarthRodCubit
                                        .multipleRodsControllers["Rod length(L)"],
                                    validator: (value) {
                                      return Validators.validator(value);
                                    },
                                    hintText: "3",
                                    obscureText: false,
                                    suffixIcon: Text(
                                      "m",
                                      style: textTheme.titleSmall,
                                    ),
                                  ),
                                  Text(
                                    "Rod Diameter (d)",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: ColorsPalette.white,
                                    ),
                                  ),
                                  Custemtextformfield(
                                    controller: multipleEarthRodCubit
                                        .multipleRodsControllers["Rod diameter(d)"],
                                    validator: (value) {
                                      return Validators.validator(value);
                                    },
                                    hintText: "0.016",
                                    obscureText: false,
                                    suffixIcon: Text(
                                      "m",
                                      style: textTheme.titleSmall,
                                    ),
                                  ),
                                  Text(
                                    "Spacing",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: ColorsPalette.white,
                                    ),
                                  ),
                                  Custemtextformfield(
                                    controller: multipleEarthRodCubit
                                        .multipleRodsControllers["spacing(s)"],
                                    validator: (value) {
                                      return Validators.validator(value);
                                    },
                                    hintText: "5",
                                    obscureText: false,
                                    suffixIcon: Text(
                                      "m",
                                      style: textTheme.titleSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Customelevatedbutton(
                              buttonText: "Calculate",
                              backGroundColor: WidgetStatePropertyAll(
                                ColorsPalette.mainOrange,
                              ),
                              onPressed: () {
                                if (multipleEarthRodCubit.formKey.currentState!
                                    .validate()) {
                                  multipleEarthRodCubit
                                      .calculateMultipleRodResistance();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MultipleRodsResultsView(
                          multipleEarthRodCubit: multipleEarthRodCubit,
                        ),
                        Customelevatedbutton(
                          buttonText: "Save As Pdf & Continue",
                          backGroundColor: WidgetStatePropertyAll(
                            ColorsPalette.buttonsOrange,
                          ),
                          onPressed: () {
                            context.read<ExportPdfCubit>().exportPdf(
                              controller:
                                  multipleEarthRodCubit.screenshotController,
                              context: context,
                              screenContent: MultipleRodsResultsView(
                                multipleEarthRodCubit: multipleEarthRodCubit,
                              ),
                              title: CalculationConstants.titles.keys
                                  .toList()[2],
                            );
                          },
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
