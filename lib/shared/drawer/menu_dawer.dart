import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery_app/app/modules/home/views/home_screen.dart';
import 'package:food_delivery_app/shared/drawer/views/drawer_menu_screen.dart';
import 'package:food_delivery_app/utils/constants.dart';

class HomeDrawerMenu extends StatefulWidget {
  static const String route = '/home-drawer';
  const HomeDrawerMenu({Key? key}) : super(key: key);

  @override
  State<HomeDrawerMenu> createState() => _HomeDrawerMenuState();
}

class _HomeDrawerMenuState extends State<HomeDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ZoomDrawer(
      menuBackgroundColor: redDark,
      mainScreen: const HomeScreen(),
      menuScreen: Builder(
        builder: (context) => const DrawerMenuScreen(),
      ),
      slideWidth: size.width * .8,
      angle: -0.0,
      showShadow: true,
      shadowLayer1Color: Colors.red.shade600,
      shadowLayer2Color: Colors.red.shade200,
    );
  }
}
