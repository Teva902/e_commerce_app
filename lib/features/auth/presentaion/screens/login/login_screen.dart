import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/routes_manager/routes.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body:Center(
        child:  GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, Routes.signUpRoute),
          child: Text(
            'Create Account',
            style: getSemiBoldStyle(color: ColorManager.white)
                .copyWith(fontSize: FontSize.s16.sp),
          ),
        ),
      )
    );
  }
}
