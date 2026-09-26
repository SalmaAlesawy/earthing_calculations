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
  static List<String> titles = [
    "Cable Sizing",
    "Single Earth Rod",
    "Multiple Earth Rods",
    "Triangular Rod System",
  ];
  static List<String> subtitles = [
    "Earthing conductor & fault current sizing",
    "Resistance calculation for a single rod",
    "2,3 or more rods configuration",
    "3-rod triangular arrangement",
  ];
  static List<String> leading = [
    Assets.images.wire.keyName,
    Assets.images.single.keyName,
    Assets.images.multipleRods.keyName,
    Assets.images.trianglur.keyName,
  ];
  static List<String> screensNames = [
    "/cableSizingScreen",
    "/singleRodScreen",
    "/MultipleRodsScreen",
    "/triangularRodScreen",
  ];
}
