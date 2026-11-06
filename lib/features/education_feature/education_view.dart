import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/features/education_feature/education_view_model/education_cubit.dart';
import 'package:earthing_calc/features/projects_features/projects_view/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Education", style: textTheme.titleLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<EducationCubit, EducationState>(
        builder: (context, state) {
          EducationCubit educationCubit = context.read<EducationCubit>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProjectCard(
                  subtitle: Text(
                    "PDF",
                    style: textTheme.bodyMedium?.copyWith(
                      color: ColorsPalette.grayText,
                    ),
                  ),
                  title: Text(
                    "Bahra Earthing Catalog",
                    style: textTheme.bodyLarge,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Assets.images.bahraCatalogImage.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                  onPressed: () {
                    educationCubit.openCatalog();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
