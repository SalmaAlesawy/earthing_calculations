import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {
  static ThemeData themeData=ThemeData(
    scaffoldBackgroundColor: ColorsPalette.backGroundColor,
        fontFamily: "inter",
        primaryColor: ColorsPalette.white,
        textTheme:  TextTheme(
            titleLarge:TextStyle(
              fontSize: 18,
              color: ColorsPalette.white,
              fontWeight: FontWeight.w500,
              fontFamily: "inter"
            ),
            titleSmall: TextStyle(
              fontFamily: "inter",
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: ColorsPalette.white
            ),
            bodySmall:TextStyle(
              fontFamily: "inter",
              fontWeight: FontWeight.w400,
                fontSize: 12,
              color: ColorsPalette.white
            ),
            titleMedium:TextStyle(
              fontFamily: "inter",
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: ColorsPalette.white
            ),
            labelSmall:TextStyle(
              fontFamily: "inter",
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: ColorsPalette.white
            ),
            headlineSmall:TextStyle(
              fontFamily: "inter",
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: ColorsPalette.white
            )
        )

  );
}