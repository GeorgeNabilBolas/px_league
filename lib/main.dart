import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Core/constants/app_colors.dart';
import 'Core/di/di.dart';
import 'Core/helpers/observer.dart';
import 'Core/routes/app_routes_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();
  final router = await AppRoutesConfig.createRouter();
  Bloc.observer = AppObserver();
  setupDI();
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
          iconTheme: const IconThemeData(color: AppColors.darkGreen),
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),

          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreen),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.darkGreen,
        ),
      ),
    );
  }
}
