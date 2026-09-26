import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:flutter/material.dart';

class CalculationsCard extends StatelessWidget {
  const CalculationsCard({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.pageRouteName,
  });
  final Image leading;
  final String title;
  final String subtitle;
  final String pageRouteName;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          
        ),
        child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(15),child: leading,),
      ),
      title: Text(
        title,
        style: textTheme.bodyMedium?.copyWith(color: ColorsPalette.white),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodySmall?.copyWith(color: ColorsPalette.grayText),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, pageRouteName);
        },
        icon: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
