import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/core/widgets/CustomeTextButton.dart';
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
                buttonText: " + New Test",
                backGroundColor: WidgetStatePropertyAll(
                  ColorsPalette.buttonsOrange,
                ),
              ),
              SizedBox(height: 24,),
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
