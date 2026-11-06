import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.subtitle,
    required this.title,
    this.leading,
    this.onPressed,
  });
  final Widget? leading;
  final Widget subtitle;
  final Widget title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsPalette.buttonBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
