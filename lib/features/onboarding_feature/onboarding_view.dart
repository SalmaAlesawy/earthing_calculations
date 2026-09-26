import 'package:earthing_calc/core/gen/assets.gen.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Assets.images.groundingRodsBackground.image(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                colors: [
                  Colors.transparent,
                  Color(0x33081217),
                  Color(0xDD081217),
                  Color(0xFF081217),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Assets.images.bahraName.image(width: MediaQuery.of(context).size.width*0.9),
                ),
                Text(
                  "SOIL RESISTIVITY &",
                  style: textTheme.titleLarge?.copyWith(
                    color: ColorsPalette.white,
                  ),
                ),
                Text(
                  "EARTHING CALCULATOR",
                  style: textTheme.titleLarge?.copyWith(
                    color: ColorsPalette.mainOrange,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: ColorsPalette.grayText),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "BS 7430",
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorsPalette.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "Accurate calculations for safe\n and reliable earthing systems",
                  style: textTheme.titleSmall?.copyWith(
                    color: ColorsPalette.grayText,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Customelevatedbutton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRouteNames.navigationScreen,
                        );
                      },
                      buttonText: "Get Started",
                      backGroundColor: WidgetStatePropertyAll(
                        ColorsPalette.buttonsOrange,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Customelevatedbutton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          PageRouteNames.loginScreen,
                        );
                      },
                      buttonText: "Sign In",
                      backGroundColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
