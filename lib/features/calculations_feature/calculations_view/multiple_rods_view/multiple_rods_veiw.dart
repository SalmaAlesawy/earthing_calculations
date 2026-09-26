import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/multiple_earth_rod_view_model/multiple_earth_rod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MultipleEarthRodCubit, MultipleEarthRodState>(
          builder: (context, state) {
            MultipleEarthRodCubit multipleEarthRodCubit = context
                .read<MultipleEarthRodCubit>();
            return Form(
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
                        border: Border.all(color: ColorsPalette.bordersColor),
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
                            controller:
                                multipleEarthRodCubit.numberOfRodsController,
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
                            controller:
                                multipleEarthRodCubit.soilResistivityController,
                            validator: (value) {
                              return Validators.validator(value);
                            },
                            hintText: "100",
                            obscureText: false,
                            suffixIcon: Text("Ω·m", style: textTheme.titleSmall),
                          ),
                          Text(
                            "Rod Length (L)",
                            style: textTheme.bodyMedium?.copyWith(
                              color: ColorsPalette.white,
                            ),
                          ),
                          Custemtextformfield(
                            controller: multipleEarthRodCubit.rodLengthController,
                            validator: (value) {
                              return Validators.validator(value);
                            },
                            hintText: "3",
                            obscureText: false,
                            suffixIcon: Text("m", style: textTheme.titleSmall),
                          ),
                          Text(
                            "Rod Diameter (d)",
                            style: textTheme.bodyMedium?.copyWith(
                              color: ColorsPalette.white,
                            ),
                          ),
                          Custemtextformfield(
                            controller:
                                multipleEarthRodCubit.rodDiameterController,
                            validator: (value) {
                              return Validators.validator(value);
                            },
                            hintText: "0.016",
                            obscureText: false,
                            suffixIcon: Text("m", style: textTheme.titleSmall),
                          ),
                          Text(
                            "Spacing",
                            style: textTheme.bodyMedium?.copyWith(
                              color: ColorsPalette.white,
                            ),
                          ),
                          Custemtextformfield(
                            controller: multipleEarthRodCubit.spacingController,
                            validator: (value) {
                              return Validators.validator(value);
                            },
                            hintText: "5",
                            obscureText: false,
                            suffixIcon: Text("m", style: textTheme.titleSmall),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  multipleEarthRodCubit.multipleRodResistance==null?  Customelevatedbutton(
                      buttonText: "Calculate",
                      backGroundColor: WidgetStatePropertyAll(
                        ColorsPalette.mainOrange,
                      ),
                      onPressed: () {
                        if(multipleEarthRodCubit.formKey.currentState!.validate()){
                          multipleEarthRodCubit.calculateMultipleRodResistance();
                        }
                
                      },
                    ):Container(
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
                          "${multipleEarthRodCubit.multipleRodResistance?.toStringAsFixed(2)} Ω",
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
