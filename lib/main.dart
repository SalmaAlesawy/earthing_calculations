import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthing_calc/core/dataBases/cache/cache_helper.dart';
import 'package:earthing_calc/core/firebase/firebase_options.dart';
import 'package:earthing_calc/core/routes/app_router.dart';
import 'package:earthing_calc/core/routes/page_route_names.dart';
import 'package:earthing_calc/core/services/service_locator.dart';
import 'package:earthing_calc/core/shared_view_models/export_pdf_cubit/export_pdf_cubit.dart';
import 'package:earthing_calc/core/shared_view_models/screenshot_cubit/screenshot_cubit.dart';
import 'package:earthing_calc/core/theme/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/calculations_feature/site_info/site_info_model/site_info_repository.dart';
import 'features/calculations_feature/site_info/site_info_view_model/site_info_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpDependencies();
  runApp(const MyApp());
  setupServiceLocator();
  await getIt<CacheHelper>().init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ScreenshotCubit()),
        BlocProvider(
          create: (context) => SiteInfoCubit(
            repository: SiteInfoRepository(FirebaseFirestore.instance),
          )..getProjects(),
        ),
        BlocProvider(create: (context) => getIt<ExportPdfCubit>()),
      ],
      child: MaterialApp(
        title: 'bahra',
        theme: ThemeManager.themeData,
        initialRoute: PageRouteNames.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
