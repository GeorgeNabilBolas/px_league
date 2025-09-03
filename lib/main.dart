import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Core/constants/app_colors.dart';
import 'Core/helpers/observer.dart';
import 'Core/routes/app_routes_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final router = await AppRoutesConfig.createRouter();
  Bloc.observer = AppObserver();
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final RouterConfig<Object> router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp.router(
        routerConfig: router,
        title: 'PX League',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',

          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreen),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.darkGreen,
        ),
      ),
    );
  }
}
