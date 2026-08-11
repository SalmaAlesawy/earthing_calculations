
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
     this.maxLines=1,
  });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  bool obscureText = false;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
   int maxLines;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        style:  TextStyle(color: ColorsPalette.white),
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16),
            hintText: hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color:ColorsPalette.grayText,
            ),
            prefixIcon:prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsPalette.grayText)),
        filled: true,
          fillColor: ColorsPalette.backGroundColor
        ),
      ),
    );
  }
}
