import 'package:earthing_calc/features/calculations_feature/calculations_constants/calculation_constants.dart';
import 'package:earthing_calc/features/calculations_feature/calculations_view/widgets/calculations_card.dart';
import 'package:flutter/material.dart';

class CalculationsView extends StatelessWidget {
  const CalculationsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculations", style: textTheme.titleLarge),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return CalculationsCard(
            leading: Image.asset(CalculationConstants.leading[index],fit: BoxFit.cover,),
            title: CalculationConstants.titles[index],
            subtitle: CalculationConstants.subtitles[index],
            pageRouteName: CalculationConstants.screensNames[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: CalculationConstants.screensNames.length,
      ),
    );
  }
}
