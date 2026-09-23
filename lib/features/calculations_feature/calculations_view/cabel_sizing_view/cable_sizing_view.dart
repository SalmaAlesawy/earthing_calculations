import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/cable_sizing_view_model/cable_sizing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
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
          CableSizingCubit calculationsCubit = context.read<CableSizingCubit>();
          print("State =$state");
          print(
            "Cable= ${calculationsCubit.calculationsModel.standardCableSize}",
          );
          return SingleChildScrollView(
            child: Form(
              key: calculationsCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  AnimatedContainer(
                    padding: EdgeInsets.all(10),
                    duration: Duration(microseconds: 300),
                    curve: Curves.easeInOut,
                    height: isSmall ? 70 : 300,
                    decoration: BoxDecoration(
                      color: ColorsPalette.buttonBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ColorsPalette.bordersColor),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Input Parameters",
                              style: textTheme.titleMedium?.copyWith(
                                color: ColorsPalette.mainOrange,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isSmall = !isSmall;
                                });
                              },
                              icon: Icon(
                                isSmall
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: ColorsPalette.white,
                              ),
                            ),
                          ],
                        ),

                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 24,
                                  mainAxisExtent: 55,
                                ),
                            itemCount: calculationsCubit.inputParameters.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    calculationsCubit
                                        .inputParameters[index]
                                        .keys
                                        .first,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontSize: 10,
                                    ),
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
                                      },
                                      controller: calculationsCubit
                                          .inputParameters[index]
                                          .values
                                          .first,
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
                            if (calculationsCubit.formKey.currentState!
                                .validate()) {
                              calculationsCubit.calculateArea();
                            }
                          },
                        )
                      : SizedBox.shrink(),
                  calculationsCubit
                              .calculationsModel
                              .requiredCrossSectionalArea !=
                          null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.27,
                              decoration: BoxDecoration(
                                color: ColorsPalette.buttonBackground,
                                border: Border.all(
                                  color: ColorsPalette.bordersColor,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calculation Summary",
                                    style: textTheme.titleLarge?.copyWith(
                                      color: ColorsPalette.mainOrange,
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.asset(
                                                calculationsCubit.images[index],
                                                height: 40,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  calculationsCubit
                                                      .summaryItems[index]["title"],
                                                  style: textTheme.titleMedium,
                                                ),
                                              ),
                                              Text(
                                                calculationsCubit
                                                    .summaryItems[index]["value"]
                                                    .toString(),
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                      color: ColorsPalette
                                                          .mainOrange,
                                                    ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                CalculationConstants
                                                    .summaryMeasures[index],
                                                style: textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return Divider();
                                      },
                                      itemCount:
                                          calculationsCubit.summaryItems.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.withAlpha(100),
                                border: Border.all(
                                  color: ColorsPalette.mainOrange,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Recommended Cable Size",
                                    style: textTheme.titleLarge?.copyWith(
                                      color: ColorsPalette.white,
                                    ),
                                  ),
                                  Text(
                                    calculationsCubit
                                            .calculationsModel
                                            .standardCableSize
                                            ?.toStringAsFixed(2) ??
                                        "",
                                    style: textTheme.titleLarge?.copyWith(
                                      color: ColorsPalette.mainOrange,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${calculationsCubit.inputParameters[3].values.first.text} Conductor",
                                    style: textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Customelevatedbutton(
                              buttonText: "Save & Continue",
                              backGroundColor: WidgetStatePropertyAll(
                                ColorsPalette.buttonsOrange,
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
