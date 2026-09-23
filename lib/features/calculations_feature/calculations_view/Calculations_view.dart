import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
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
      body: Column(
        children: [
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorsPalette.mainOrange),
              ),
              child: Assets.images.wire.image(width: 40),
            ),
            title: Text(
              "Cable Sizing",
              style: textTheme.bodyMedium?.copyWith(color: ColorsPalette.white),
            ),
            subtitle: Text(
              "Earthing conductor &fault current sizing",
              style: textTheme.bodySmall?.copyWith(
                color: ColorsPalette.grayText,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, PageRouteNames.cableSizingScreen);

              },
              icon: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
