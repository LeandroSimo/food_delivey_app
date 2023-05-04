import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          Icons.person_outline,
          color: white,
        ),
      ),
      title: Text(
        'Leandro Simões',
        style: GoogleFonts.poppins(color: white),
      ),
      trailing: InkWell(
        onTap: () => ZoomDrawer.of(context)!.close(),
        child: Container(
          height: 45.h,
          width: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: white,
          ),
          child: const Icon(
            Icons.close,
            color: black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
