import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/shared_view_models/export_pdf_cubit/export_pdf_cubit.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/cabel_sizing_view/cable_sizing_results_view.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/cable_sizing_view_model/cable_sizing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class CableSizingView extends StatefulWidget {
  const CableSizingView({super.key});

  @override
  State<CableSizingView> createState() => _CableSizingViewState();
}

class _CableSizingViewState extends State<CableSizingView> {
  bool isSmall = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_sharp),
            color: ColorsPalette.white,
          ),
          title: Text(
            "Cable Sizing Calculation",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),

        body: BlocBuilder<CableSizingCubit, CableSizingState>(
          builder: (context, state) {
            CableSizingCubit calculationsCubit = context
                .read<CableSizingCubit>();
            print("State =$state");
            print(
              "Cable= ${calculationsCubit.calculationsModel.standardCableSize}",
            );
            return BlocListener<ExportPdfCubit, ExportPdfState>(
              listener: (context, state) async {
                if (state is SuccessExportingPdfState) {
                  await Printing.layoutPdf(
                    onLayout: (_) async => state.pdfBytes,
                  );
                  Navigator.pushNamed(
                    context,
                    PageRouteNames.calculationsScreen,
                  );
                }
                if (state is ErrorExportingPdfState) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              child: SingleChildScrollView(
                child:
                    calculationsCubit.calculationsModel.standardCableSize ==
                        null
                    ? Form(
                        key: calculationsCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 10,
                          children: [
                            Text(
                              "Input Parameters",
                              style: textTheme.titleMedium?.copyWith(
                                color: ColorsPalette.mainOrange,
                              ),
                            ),
                            AnimatedContainer(
                              padding: EdgeInsets.all(10),
                              duration: Duration(microseconds: 300),
                              curve: Curves.easeInOut,
                              height: isSmall ? 70 : 300,
                              decoration: BoxDecoration(
                                color: ColorsPalette.buttonBackground,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: ColorsPalette.bordersColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 24,
                                            mainAxisExtent: 55,
                                          ),
                                      itemCount: calculationsCubit
                                          .inputParameters
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              calculationsCubit
                                                  .inputParameters
                                                  .keys
                                                  .toList()[index],
                                              style: textTheme.titleSmall
                                                  ?.copyWith(fontSize: 10),
                                            ),
                                            SizedBox(height: 5),
                                            SizedBox(
                                              height: 35,
                                              child: Custemtextformfield(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.trim().isEmpty) {
                                                    return 'This Field is required';
                                                  }
                                                  return null;
                                                },
                                                controller: calculationsCubit
                                                    .inputParameters
                                                    .values
                                                    .toList()[index],
                                                hintText: "",
                                                obscureText: false,
                                                suffixIcon: Text(
                                                  CalculationConstants
                                                      .inputMeasures[index],
                                                  style: textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            calculationsCubit
                                        .calculationsModel
                                        .requiredCrossSectionalArea ==
                                    null
                                ? Customelevatedbutton(
                                    buttonText: "Calculate",
                                    backGroundColor: WidgetStatePropertyAll(
                                      ColorsPalette.buttonsOrange,
                                    ),
                                    onPressed: () {
                                      if (calculationsCubit
                                          .formKey
                                          .currentState!
                                          .validate()) {
                                        calculationsCubit.calculateArea();
                                      }
                                    },
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      )
                    : Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CableSizingResultsView(
                            cableSizingCubit: calculationsCubit,
                          ),
                          Customelevatedbutton(
                            buttonText: "Save As Pdf & Continue",
                            backGroundColor: WidgetStatePropertyAll(
                              ColorsPalette.buttonsOrange,
                            ),
                            onPressed: () async {
                              await context.read<ExportPdfCubit>().exportPdf(
                                controller:
                                    calculationsCubit.screenshotController,
                                context: context,
                                screenContent: CableSizingResultsView(
                                  cableSizingCubit: calculationsCubit,
                                ),
                                title: CalculationConstants.titles.keys
                                    .toList()[0],
                              );
                            },
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
