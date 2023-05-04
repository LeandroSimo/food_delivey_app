import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.textInputType,
    required this.obscureText,
    this.controller,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: orangeDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: orangeDark,
          ),
        ),
        label: Text(
          label,
        ),
        labelStyle: GoogleFonts.poppins(
          fontSize: 20.sp,
          color: orangeDark,
        ),
        suffixIcon: suffixIcon,
      ),
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
    );
  }
}
