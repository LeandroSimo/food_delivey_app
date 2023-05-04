import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_delivery_app/config/routes.dart';
import 'package:food_delivery_app/shared/controllers/home_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ScreenUtilInit(
        designSize: const Size(435, 926),
        // designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food Delivery App',
            routes: Routes.routes,
            home: const HomeController(),
          );
        },
      ),
    );
  }
}
