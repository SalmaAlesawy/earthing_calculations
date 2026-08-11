
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  final String textButton;
  final void Function() onPressed;
  const CustomTextButton({super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor:
        const WidgetStatePropertyAll(Colors.transparent),
        shadowColor:
        const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor:
        WidgetStatePropertyAll(ColorsPalette.buttonsOrange),
        alignment: Alignment.centerRight,
      ),
      onPressed: onPressed,
      child: Text(
        textButton,
      ),
    );
  }
}
