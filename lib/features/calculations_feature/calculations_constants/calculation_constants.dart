import 'package:earthing_calc/core/gen/assets.gen.dart';

abstract class CalculationConstants {
  static List<String> inputMeasures = ["", "A", "S", "", "°C", "°C"];
  static List<String> summaryMeasures = ["A·√s/mm²", "mm²", "mm²"];
  static List<double> standardMeasures = [
    4,
    6,
    16,
    25,
    35,
    50,
    70,
    95,
    120,
    150,
    185,
    240,
    300,
    400,
    500,
  ];
  static Map<String, String> titles = {
    "Cable Sizing": "According to BS 7430 ",
    "Single Earth Rod": "According to BS 7430:2011 + A1:2015 Equation 9.5.3",
    "Multiple Earth Rods":
        "According to BS 7430:2011 + A1:2015 Equation 9.5.8.5",
    "Triangular Rod System":
        "According to BS 7430:2011+A1:2015 Equation 9.5.8.1",
    "Soil Resistivity Test":
        "According to wenner method in accordance with BS 7430 and with the support of FLUKE-1625-2 kit Earth Ground Tester",
  };
  static List<String> subtitles = [
    "Earthing conductor & fault current sizing",
    "Resistance calculation for a single rod",
    "2,3 or more rods configuration",
    "3-rod triangular arrangement",
    "Soil Resistivity test using wenner method",
  ];
  static List<String> leading = [
    Assets.images.wire.keyName,
    Assets.images.single.keyName,
    Assets.images.multipleRods.keyName,
    Assets.images.trianglur.keyName,
    Assets.images.soilTesting.keyName,
  ];
  static List<String> screensNames = [
    "/cableSizingScreen",
    "/singleRodScreen",
    "/MultipleRodsScreen",
    "/triangularRodScreen",
    "/soilResistivityScreen",
  ];

  static List<Map<String, dynamic>> equationsDetails = [
    {
      "image": Assets.images.materialCoefficientFormulaPanel.keyName,
      "title": "K (Material coefficient)",
      "details": {
        "α": "Material constant ",
        "β": "Material constant ",
        "T2": "Material permitted final temperature (°C)",
        "T1": "Ambient temperature (°C)",
      },
    },
    {
      "image": Assets.images.crossSectionalAreaFormulaCard.keyName,
      "title": "A (Cross Section Area)",
      "details": {
        "A": "Cross section area of the main earthing conductor (mm²)",
        "I": "Fault current (ampere)",
        "t": "Duration of fault current (seconds)",
        "K": "Material coefficient (A.sqrt(sec.)/mm²)",
      },
    },
  ];
  static Map<String, dynamic> materialConstant = {"α": 226, "β": 234.5};
}
