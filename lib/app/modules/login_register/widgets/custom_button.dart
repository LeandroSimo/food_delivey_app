import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() func;
  final Widget? widget;
  final Color? backgroundColor;
  final Color? textColor;
  final bool containsWidget;
  const CustomButton({
    super.key,
    required this.text,
    required this.func,
    this.widget,
    this.backgroundColor,
    this.textColor,
    required this.containsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: widget,
          ),
          containsWidget
              ? Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                )
        ],
      ),
      onPressed: func,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(12),
      color: backgroundColor,
      elevation: 5,
    );
  }
}
