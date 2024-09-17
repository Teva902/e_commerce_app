import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/features/auth/presentaion/screens/login/login_screen.dart';
import 'package:e_commerce_app/features/auth/presentaion/screens/register/register_screen.dart';
import 'package:e_commerce_app/features/cart/cart_screen.dart';
import 'package:e_commerce_app/features/main_Layout/main_layout.dart';
import 'package:e_commerce_app/features/product_screen/screen/products_screen.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => ProductsScreen());

      // case Routes.productDetails:
      //   return MaterialPageRoute(builder: (_) =>  ProductDetails(product:,));

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
