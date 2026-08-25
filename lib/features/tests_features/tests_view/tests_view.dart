import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/colors_palette.dart';
import 'package:earthing_calc/core/widgets/CustemTextformField.dart';
import 'package:earthing_calc/core/widgets/CustomElevatedButton.dart';
import 'package:earthing_calc/core/widgets/CustomeTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestsView extends StatelessWidget {
  const TestsView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          "Tests",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, PageRouteNames.newSoilTestScreen);
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
              decoration: BoxDecoration(
                color: ColorsPalette.buttonsOrange,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Row(
                children: [
                  Icon(Icons.add,color: ColorsPalette.white,),
                  Text("New Test",style: textTheme.titleMedium,)
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Custemtextformfield(
                hintText: "Search",
                obscureText: false,
                prefixIcon: Icon(CupertinoIcons.search),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Tests",
                    style: textTheme.bodyMedium?.copyWith(
                      color: ColorsPalette.white,
                      fontSize: 20,
                    ),
                  ),
                  CustomTextButton(textButton: "View All", onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
