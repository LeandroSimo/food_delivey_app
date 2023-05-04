import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_delivery_app/app/modules/login_register/views/login_screen.dart';
import 'package:food_delivery_app/shared/drawer/widgets/info_card.dart';
import 'package:food_delivery_app/shared/drawer/widgets/side_menu_tile.dart';
import 'package:food_delivery_app/shared/model/rive_model.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:food_delivery_app/utils/rive.utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class DrawerMenuScreen extends StatefulWidget {
  const DrawerMenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerMenuScreen> createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  RiveModel selectedMenu = sideMenu.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: redDark,
            ),
          ),
          color: redDark,
        ),
        height: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              const InfoCard(),
              SizedBox(height: 50.h),
              const Divider(
                height: 1,
                color: white,
              ),
              SizedBox(height: 50.h),
              ...sideMenu.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(
                      artboard,
                      stateMachineName: menu.stateMachineName,
                    );
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  func: () {
                    setState(() {
                      selectedMenu = menu;
                    });
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              SizedBox(
                height: 170.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: MaterialButton(
                  child: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      color: white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: white),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(LoggedOutEvent());
                    Navigator.pushReplacementNamed(context, LoginScreen.route);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
