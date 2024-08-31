import 'dart:async';

import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.signInRoute);
    });
    return Scaffold(
        body: Image.asset(
          ImageAssets.splashScreen,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ));
  }
}
