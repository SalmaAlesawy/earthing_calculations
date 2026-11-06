import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/shared_view_models/export_pdf_cubit/export_pdf_cubit.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/single_rod_view/single_rod_result_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/single_earth_rod_view_model/single_earth_rod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class SingleRodView extends StatelessWidget {
  const SingleRodView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Earth Rod", style: textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SingleEarthRodCubit, SingleEarthRodState>(
              builder: (context, state) {
                SingleEarthRodCubit singleEarthRodCubit = context
                    .read<SingleEarthRodCubit>();
                return singleEarthRodCubit.singleRodResistance == null
                    ? Form(
                        key: singleEarthRodCubit.formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Assets.images.singleEarthRod.image(),

                              Container(
                                padding: EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorsPalette.bordersColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Input Parameters",
                                      style: textTheme.bodyLarge?.copyWith(
                                        color: ColorsPalette.mainOrange,
                                      ),
                                    ),
                                    Text(
                                      "Soil Resistivity (p)",
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: ColorsPalette.white,
                                      ),
                                    ),
                                    Custemtextformfield(
                                      validator: (value) {
                                        return Validators.validator(value);
                                      },
                                      controller: singleEarthRodCubit
                                          .singleRodControllers["soil Resistivity"],
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
                                      validator: (value) {
                                        return Validators.validator(value);
                                      },
                                      controller: singleEarthRodCubit
                                          .singleRodControllers["rod Length"],
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
                                      validator: (value) {
                                        return Validators.validator(value);
                                      },
                                      controller: singleEarthRodCubit
                                          .singleRodControllers["rod Diameter"],
                                      hintText: "0.016",
                                      obscureText: false,
                                      suffixIcon: Text(
                                        "Ω·m",
                                        style: textTheme.titleSmall,
                                      ),
                                    ),
                                    Text(
                                      "Rod Material",
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: ColorsPalette.white,
                                      ),
                                    ),
                                    Custemtextformfield(
                                      validator: (value) {
                                        return Validators.validator(value);
                                      },
                                      controller: singleEarthRodCubit
                                          .singleRodControllers["rod Material"],
                                      hintText: "Copper Bonded Steel",
                                      obscureText: false,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              Customelevatedbutton(
                                buttonText: "Calculate",
                                backGroundColor: WidgetStatePropertyAll(
                                  ColorsPalette.mainOrange,
                                ),
                                onPressed: () {
                                  if (singleEarthRodCubit.formKey.currentState!
                                      .validate()) {
                                    singleEarthRodCubit
                                        .calculateSingleRodResistance();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SingleRodResultView(
                            singleEarthRodCubit: singleEarthRodCubit,
                          ),
                          Customelevatedbutton(
                            buttonText: "Save As Pdf & Continue",
                            backGroundColor: WidgetStatePropertyAll(
                              ColorsPalette.buttonsOrange,
                            ),
                            onPressed: () {
                              context.read<ExportPdfCubit>().exportPdf(
                                controller:
                                    singleEarthRodCubit.screenshotController,
                                context: context,
                                screenContent: SingleRodResultView(
                                  singleEarthRodCubit: singleEarthRodCubit,
                                ),
                                title: CalculationConstants.titles.keys
                                    .toList()[1],
                              );
                            },
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
