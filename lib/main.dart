import 'package:e_commerce_app/core/my_bloc_observer.dart';
import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widget/shared_prefernce_utils.dart';
import 'package:e_commerce_app/domain/di/di.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_screen_view_model.dart';
import 'package:e_commerce_app/features/main_Layout/favourite_screen/cubit/watch_list_screen_view_model.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String route;
  if (token == null) {
    route = Routes.signInRoute;
  } else {
    route = Routes.mainRoute;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<HomeTabViewModel>(
            create: (context) => getIt<HomeTabViewModel>()),
        BlocProvider<ProductScreenViewModel>(
            create: (context) => getIt<ProductScreenViewModel>()),
        BlocProvider<CartScreenViewModel>(
            create: (context) => getIt<CartScreenViewModel>()),
        BlocProvider<WatchListScreenViewModel>(
            create: (context) => getIt<WatchListScreenViewModel>()),
      ],
      child: MainApp(
        route: route,
      )));
}


class MainApp extends StatelessWidget {
  String route;

  MainApp({required this.route});

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
        initialRoute: route,
      ),
    );
  }
}
