import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/shared/model/rive_model.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  final RiveModel menu;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;
  final void Function() func;
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.riveOnInit,
    required this.isActive,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 65.h,
          width: isActive ? 288 : 0,
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // : const SizedBox(),
        ListTile(
          onTap: func,
          leading: SizedBox(
            height: 38.h,
            width: 38.w,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveOnInit,
            ),
          ),
          title: Text(
            menu.title,
            style: GoogleFonts.poppins(
              color: white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
