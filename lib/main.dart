import 'package:e_commerce_app/core/my_bloc_observer.dart';
import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/domain/di/di.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
    BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
  ], child: MainApp()));
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashScreenRoute,
      ),
    );
  }
}
