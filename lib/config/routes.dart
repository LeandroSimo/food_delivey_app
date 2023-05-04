import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/modules/login_register/views/login_screen.dart';
import 'package:food_delivery_app/app/modules/product/views/product_detail.dart';
import 'package:food_delivery_app/app/modules/welcome/views/welcome_screen.dart';

import 'package:food_delivery_app/shared/drawer/menu_dawer.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    WelcomeScreen.route: (_) => const WelcomeScreen(),
    HomeDrawerMenu.route: (_) => const HomeDrawerMenu(),
    ProductDetail.route: (_) => const ProductDetail(),
    LoginScreen.route: (_) => const LoginScreen(),
  };
}
