import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';

class Custemtextformfield extends StatelessWidget {
  Custemtextformfield({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    required this.obscureText,
    this.validator,
    this.controller,
    this.maxLines = 1,
    this.onTap,
    this.suffixText,
  });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  bool obscureText = false;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: TextFormField(
        onTap: onTap,
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        style: TextStyle(color: ColorsPalette.white),
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 2),
          hintText: hintText,
          hintStyle: textTheme.bodySmall?.copyWith(
            color: ColorsPalette.grayText,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 25),
            child: suffixIcon,
          ),
          suffixText: suffixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorsPalette.grayText),
          ),
          filled: true,
          fillColor: ColorsPalette.backGroundColor,
        ),
      ),
    );
  }
}
