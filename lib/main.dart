import 'package:flutter/material.dart';
import 'Core/constants/app_colors.dart';
import 'Core/helpers/observer.dart';
import 'Core/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final router = await AppRoutes.createRouter();
  Bloc.observer = AppObserver();
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final RouterConfig<Object> router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'PX League',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreen),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.darkGreen,
      ),
    );
  }
}
