import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.values,
    required this.length,
  });
  final List<String> title;
  final List<String> values;
  final int length;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title[index],
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text("${values[index]} ", style: textTheme.titleSmall),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
