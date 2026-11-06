import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_view_model/site_info_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/project_card.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Projects",
          style: textTheme.titleLarge?.copyWith(fontSize: 24),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: BlocBuilder<SiteInfoCubit, SiteInfoState>(
            builder: (context, state) {
              if (state is SiteInfoLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SiteInfoErrorState) {
                return Text("Error: ${state.errorMessage}");
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Custemtextformfield(
                    hintText: "Search",
                    obscureText: false,
                    prefixIcon: Icon(CupertinoIcons.search),
                  ),
                  SizedBox(height: 20),
                  Customelevatedbutton(
                    buttonText: " New Project",
                    backGroundColor: WidgetStatePropertyAll(
                      ColorsPalette.buttonsOrange,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PageRouteNames.projectInfoScreen,
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Projects",
                        style: textTheme.bodyMedium?.copyWith(
                          color: ColorsPalette.white,
                          fontSize: 20,
                        ),
                      ),
                      CustomTextButton(
                        textButton: "View All",
                        onPressed: () {},
                      ),
                    ],
                  ),

                  Expanded(
                    child: state is SiteInfoLoadedState
                        ? state.projects.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    final project = state.projects[index];
                                    return ProjectCard(
                                      subtitle: Text(
                                        project.contractorName,
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: Colors.teal,
                                          fontSize: 20,
                                        ),
                                      ),
                                      title: Text(
                                        "${project.screenshots.length.toString()} screenshots",
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: Colors.teal,
                                          fontSize: 20,
                                        ),
                                      ),
                                      leading: Text(
                                        project.projectName,
                                        style: textTheme.titleLarge,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 10);
                                  },
                                  itemCount: state.projects.length,
                                )
                              : SizedBox.shrink()
                        : SizedBox.shrink(),
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
