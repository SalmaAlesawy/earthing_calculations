import 'package:earthing_calc/core/routes/app_router.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/theme/theme_manager.dart';
import 'package:earthing_calc/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bahra',
      theme: ThemeManager.themeData,
      initialRoute: PageRouteNames.splashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
