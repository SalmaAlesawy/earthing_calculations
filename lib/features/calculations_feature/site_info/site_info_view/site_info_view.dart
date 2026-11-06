import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/shared_view_models/screenshot_cubit/screenshot_cubit.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/validators/validators.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_model/site_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../site_info_view_model/site_info_cubit.dart';

class SiteInfoView extends StatelessWidget {
  const SiteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
        ),
        title: Text("Project Information", style: textTheme.titleLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<SiteInfoCubit, SiteInfoState>(
            listener: (context, state) {
              if (state is SiteInfoErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is SiteTempInfoState) {
                Navigator.pushNamed(context, PageRouteNames.calculationsScreen);
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
                      validator: (value) {
                        Validators.generalValidate(value, "Project Name");
                        return null;
                      },
                      controller: siteInfoCubit.projectNameController,
                      hintText: "Enter project name",
                      obscureText: false,
                    ),

                    SizedBox(height: 10),
                    Text("Contractor Name", style: textTheme.titleSmall),
                    Custemtextformfield(
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        Validators.generalValidate(value, "Contractor Name");
                        return null;
                      },
                      controller: siteInfoCubit.contractorNameController,
                      hintText: "Contractor Name",
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    Text("Client Name", style: textTheme.titleSmall),
                    Custemtextformfield(
                      validator: (value) {
                        Validators.generalValidate(value, "Client Name");
                        return null;
                      },
                      controller: siteInfoCubit.clientNameController,
                      hintText: "Client Name",
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    Text("Consultant Name", style: textTheme.titleSmall),
                    Custemtextformfield(
                      controller: siteInfoCubit.consultantNameController,
                      hintText: "Consultant Name",
                      obscureText: false,
                      validator: (value) {
                        Validators.generalValidate(value, "Consultant Name");
                        return null;
                      },
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
                    state is SiteInfoLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : Customelevatedbutton(
                            buttonText: "Next",
                            backGroundColor: WidgetStatePropertyAll(
                              ColorsPalette.buttonsOrange,
                            ),
                            onPressed: () {
                              if (siteInfoCubit.formKey.currentState!
                                  .validate()) {
                                final screenshotsCubit = context
                                    .read<ScreenshotCubit>();
                                debugPrint(
                                  "Save Cubit instance: ${identityHashCode(screenshotsCubit)}",
                                );
                                debugPrint(
                                  "Files before saving: ${screenshotsCubit.state}",
                                );

                                siteInfoCubit.saveProjectTemporarily(
                                  SiteInfoModel(
                                    projectName: siteInfoCubit
                                        .projectNameController
                                        .text,
                                    contractorName: siteInfoCubit
                                        .contractorNameController
                                        .text,
                                    clientName:
                                        siteInfoCubit.clientNameController.text,
                                    consultantName: siteInfoCubit
                                        .consultantNameController
                                        .text,
                                    location:
                                        siteInfoCubit.locationController.text,
                                  ),
                                );
                              }
                            },
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
