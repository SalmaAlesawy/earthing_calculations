import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/features/tests_features/new_soil_test_feature/new_soil_test_view_model/new_soil_test_cubit.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_model/site_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../site_info_view_model/site_info_cubit.dart';

class SiteInfoView extends StatelessWidget {
  const SiteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<SiteInfoCubit, SiteInfoState>(
          listener: (context, state) {
            if (state is SiteInfoSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Project Add Successfully")),
              );
            }
            if (state is SiteInfoErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            SiteInfoCubit siteInfoCubit = context.read<SiteInfoCubit>();
            return Form(
              key: siteInfoCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  Text("Project Name", style: textTheme.titleSmall),
                  Custemtextformfield(
                    validator: Validators.validateName,
                    controller: siteInfoCubit.projectNameController,
                    hintText: "Enter project name",
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  Text("Location", style: textTheme.titleSmall),
                  Custemtextformfield(
                    validator: Validators.validateLocation,
                    controller: siteInfoCubit.locationController,
                    hintText: "Enter Location",
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  Text("Test Date", style: textTheme.titleSmall),
                  Custemtextformfield(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2028),
                      );
                      if (date != null) {
                        siteInfoCubit.testDateController.text =
                        '${date.day}/${date.month}/${date.year}';
                      }
                    },
                    keyboardType: TextInputType.datetime,
                    validator: Validators.validator,
                    controller: siteInfoCubit.testDateController,
                    hintText: "May 14,2004",
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  Text("Test By", style: textTheme.titleSmall),
                  Custemtextformfield(
                    validator: Validators.validateTestBy,
                    controller: siteInfoCubit.testByController,
                    hintText: "Enter name",
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  Text("Notes (Optional)", style: textTheme.titleSmall),
                  Custemtextformfield(
                    controller: siteInfoCubit.notesController,
                    hintText: "Enter notes",
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<NewSoilTestCubit, NewSoilTestState>(
                    builder: (context, state) {
                      NewSoilTestCubit newSoilTestCubit=context.read<NewSoilTestCubit>();
                      return Customelevatedbutton(
                        buttonText: "Next",
                        backGroundColor: WidgetStatePropertyAll(
                          ColorsPalette.buttonsOrange,
                        ),
                        onPressed: () {
                          if (siteInfoCubit.formKey.currentState!.validate()) {
                            context.read<SiteInfoCubit>().addProject(
                              SiteInfoModel(
                                projectName:
                                siteInfoCubit.projectNameController.text,
                                location: siteInfoCubit.locationController.text,
                                testDate:
                                siteInfoCubit.testDateController.text.isEmpty
                                    ? null
                                    : DateFormat('dd/MM/yy').parse(
                                  siteInfoCubit.testDateController.text,
                                ),
                                testBy: siteInfoCubit.testByController.text,
                                notes: siteInfoCubit.notesController.text,
                              ),

                            );
                            newSoilTestCubit.nextStep();
                          }
                        },
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
