import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/shared_view_models/screenshot_cubit/screenshot_cubit.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/widgets/calculations_card.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_view_model/site_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationsView extends StatelessWidget {
  const CalculationsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocListener<SiteInfoCubit, SiteInfoState>(
      listener: (context, state) {
        if (state is SiteInfoSuccessState) {
          context.read<ScreenshotCubit>().clearScreenshots();
          context.read<SiteInfoCubit>().currentProject = null;
          Navigator.pushNamed(context, PageRouteNames.navigationScreen);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Project add successfully")));
        }
        if (state is SiteInfoErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculations", style: textTheme.titleLarge),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CalculationsCard(
                    leading: Image.asset(
                      CalculationConstants.leading[index],
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                    title: CalculationConstants.titles.keys.toList()[index],
                    subtitle: CalculationConstants.subtitles[index],
                    pageRouteName: CalculationConstants.screensNames[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox();
                },
                itemCount: CalculationConstants.screensNames.length,
              ),
            ),
            Customelevatedbutton(
              buttonText: "Save the Project",
              backGroundColor: WidgetStatePropertyAll(
                ColorsPalette.buttonsOrange,
              ),
              onPressed: () {
                final siteInfoCubit = context.read<SiteInfoCubit>();
                final project = siteInfoCubit.currentProject;
                final pdfFiles = context.read<ScreenshotCubit>().state;

                if (project == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter project information first"),
                    ),
                  );
                  return;
                }
                siteInfoCubit.addProject(project, pdfFiles);
              },
            ),
          ],
        ),
      ),
    );
  }
}
