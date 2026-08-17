import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/core/widgets/CustomeTextButton.dart';
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
                Text(
                  "Probe Spacing (a)",
                  style: textTheme.bodyMedium?.copyWith(
                    color: ColorsPalette.white,
                  ),
                ),
                Custemtextformfield(
                  controller: measurementsCubit.probeSpacingController,
                  hintText: "20",
                  obscureText: false,
                  validator: (value) =>
                      Validators.validateNumber(value, "probe Spacing"),
                ),
                SizedBox(height: 10),
                Text(
                  "Resistance Readings (R)",
                  style: textTheme.bodyMedium?.copyWith(
                    color: ColorsPalette.white,
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: measurementsCubit.index,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text(
                          "R ${index + 1}",
                          style: textTheme.titleSmall?.copyWith(
                            color: ColorsPalette.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.13,
                        ),
                        Expanded(
                          child: Custemtextformfield(
                            validator: (value) => Validators.validateNumber(
                              value,
                              "R${index + 1}",
                            ),
                            controller: measurementsCubit.resistanceControllers[index],
                            hintText: "${index + 10.13}",
                            obscureText: false,
                          ),
                        ),
                      ],
                    );
                  },
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
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<NewSoilTestCubit, NewSoilTestState>(
                      builder: (context, state) {
                        NewSoilTestCubit newSoilTestCubit = context
                            .read<NewSoilTestCubit>();
                        return Expanded(
                          child: Customelevatedbutton(
                            backGroundColor: WidgetStatePropertyAll(
                              Colors.black26,
                            ),
                            buttonText: "Back",
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Customelevatedbutton(
                        borderColor: ColorsPalette.buttonsOrange,
                        backGroundColor: WidgetStatePropertyAll(
                          ColorsPalette.buttonsOrange,
                        ),
                        buttonText: "Calculate",
                        onPressed: () {
                          if (measurementsCubit.formKey.currentState!
                              .validate()) {
                            for (TextEditingController resistance
                                in measurementsCubit.resistanceControllers) {
                              measurementsCubit.calculations(
                                resistance.text,
                                measurementsCubit.probeSpacingController.text,
                              );
                              print(measurementsCubit.soilResistivity);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
