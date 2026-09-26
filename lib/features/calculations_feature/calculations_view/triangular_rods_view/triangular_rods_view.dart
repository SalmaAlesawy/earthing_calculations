import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view_model/triangular_rod_system_view_model/triangular_rod_system_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriangularRodsView extends StatelessWidget {
  const TriangularRodsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Triangular Rod System", style: textTheme.titleLarge),
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
      body: BlocBuilder<TriangularRodSystemCubit, TriangularRodSystemState>(
        builder: (context, state) {
          TriangularRodSystemCubit triangularRodSystemCubit = context
              .read<TriangularRodSystemCubit>();
          return Form(
            key: triangularRodSystemCubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 30,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Assets.images.triangularRodSystem.image(),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      border: Border.all(color: ColorsPalette.bordersColor),
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
                          controller:
                              triangularRodSystemCubit.soilResistivityController,
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
                          controller:
                              triangularRodSystemCubit.rodLengthController,
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
                              triangularRodSystemCubit.rodDiameterController,
                          validator: (value) {
                            return Validators.validator(value);
                          },
                          hintText: "0.016",
                          obscureText: false,
                          suffixIcon: Text("m", style: textTheme.titleSmall),
                        ),
                        Text(
                          "Triangle Side (s)",
                          style: textTheme.bodyMedium?.copyWith(
                            color: ColorsPalette.white,
                          ),
                        ),
                        Custemtextformfield(
                          controller:
                              triangularRodSystemCubit.triangularSideController,
                          validator: (value) {
                            return Validators.validator(value);
                          },
                          hintText: "5",
                          suffixIcon: Text("m", style: textTheme.titleSmall),
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  triangularRodSystemCubit.triangularResistance == null
                      ? Customelevatedbutton(
                          buttonText: "Calculate",
                          backGroundColor: WidgetStatePropertyAll(
                            ColorsPalette.mainOrange,
                          ),
                          onPressed: () {
                            if (triangularRodSystemCubit.formKey.currentState!
                                .validate()) {
                              triangularRodSystemCubit
                                  .calculateTriangularResistance();
                            }
                          },
                        )
                      : Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: ColorsPalette.bordersColor),
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
                                "${triangularRodSystemCubit.triangularResistance?.toStringAsFixed(2)} Ω",
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
    );
  }
}
