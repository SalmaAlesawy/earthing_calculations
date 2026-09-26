import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/custom_text_form_field.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:earthing_calc/core/widgets/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          child: Column(
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
                buttonText: " New Test",
                backGroundColor: WidgetStatePropertyAll(
                  ColorsPalette.buttonsOrange,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PageRouteNames.newSoilTestScreen,
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
                  CustomTextButton(textButton: "View All", onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
