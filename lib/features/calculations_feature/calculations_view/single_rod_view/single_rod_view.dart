import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/widgets/summary_card.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/single_earth_rod_view_model/single_earth_rod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SingleEarthRodCubit, SingleEarthRodState>(
          builder: (context, state) {
            SingleEarthRodCubit singleEarthRodCubit = context
                .read<SingleEarthRodCubit>();
            return Form(
              key: singleEarthRodCubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    singleEarthRodCubit.singleRodResistance == null
                        ? Assets.images.singleEarthRod.image()
                        : Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorsPalette.bordersColor,
                              ),
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
                                  "${singleEarthRodCubit.singleRodResistance?.toStringAsFixed(2)} Ω",
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
                    singleEarthRodCubit.singleRodResistance == null
                        ? Container(
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
                                      .soilResistivityController,
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
                                  controller:
                                      singleEarthRodCubit.rodLengthController,
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
                                  controller:
                                      singleEarthRodCubit.rodDiameterController,
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
                                  controller:
                                      singleEarthRodCubit.rodMaterialController,
                                  hintText: "Copper Bonded Steel",
                                  obscureText: false,
                                ),
                              ],
                            ),
                          )
                        : SummaryCard(
                            soilResistivity: singleEarthRodCubit
                                .soilResistivityController
                                .text,
                            rodLength:
                                singleEarthRodCubit.rodLengthController.text,
                            rodDiameter:
                                singleEarthRodCubit.rodDiameterController.text,
                            rodMaterial:
                                singleEarthRodCubit.rodMaterialController.text,
                          ),
                    SizedBox(height: 30),
                    singleEarthRodCubit.singleRodResistance == null
                        ? Customelevatedbutton(
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
                          )
                        : Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsPalette.bordersColor),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Assets.images.singleResult.image()),
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
