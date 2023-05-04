import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_delivery_app/app/modules/login_register/widgets/custom_button.dart';
import 'package:food_delivery_app/app/modules/login_register/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/data/service/auth/firebase_autentication.dart';
import 'package:food_delivery_app/shared/controllers/email_and_password_controller.dart';
import 'package:food_delivery_app/shared/drawer/menu_dawer.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageLogin extends StatefulWidget {
  final Duration duration;
  final Function() func;
  bool isVisibility;

  PageLogin({
    super.key,
    required this.duration,
    required this.func,
    required this.isVisibility,
  });

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  _showSnackBarOnFail(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade800,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  _clear() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void initState() {
    _clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DelayedDisplay(
                    delay: widget.duration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 55.sp,
                            color: black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: LottieBuilder.asset(
                            'assets/lottie/login.json',
                            width: 140.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DelayedDisplay(
                    delay: widget.duration,
                    child: CustomTextFormField(
                      label: 'E-mail',
                      textInputType: TextInputType.emailAddress,
                      obscureText: false,
                      controller: emailController,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  DelayedDisplay(
                    delay: widget.duration,
                    child: CustomTextFormField(
                      label: 'Password',
                      textInputType: TextInputType.emailAddress,
                      obscureText: !widget.isVisibility,
                      controller: passwordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !widget.isVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: orange,
                        ),
                        onPressed: () => setState(
                          () => widget.isVisibility = !widget.isVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  DelayedDisplay(
                    delay: widget.duration,
                    child: state is IsLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: orangeDark,
                            ),
                          )
                        : CustomButton(
                            text: 'Login',
                            func: () {
                              context.read<AuthBloc>().add(
                                    LoggedInEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      onFail: (message) =>
                                          _showSnackBarOnFail(context, message),
                                      thenValue: (value) =>
                                          Navigator.popAndPushNamed(
                                              context, HomeDrawerMenu.route),
                                    ),
                                  );
                            },
                            backgroundColor: orangeDark,
                            textColor: white,
                            containsWidget: false,
                          ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  DelayedDisplay(
                    delay: widget.duration,
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: grey,
                            endIndent: 10,
                            thickness: 1,
                            indent: 10,
                          ),
                        ),
                        Text(
                          'or',
                          style: GoogleFonts.poppins(
                            color: grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: grey,
                            endIndent: 10,
                            thickness: 1,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  DelayedDisplay(
                    delay: widget.duration,
                    child: CustomButton(
                      widget: Padding(
                        padding: const EdgeInsets.only(left: 60, right: 40),
                        child: Image.asset(
                          'assets/google.png',
                          width: 40.w,
                        ),
                      ),
                      text: 'Goolge',
                      func: () => FirebaseAutentication().singInWithGoogle(),
                      backgroundColor: white,
                      containsWidget: true,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  DelayedDisplay(
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 130,
                        right: 130,
                      ),
                      child: MaterialButton(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        shape: const BeveledRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        onPressed: widget.func,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
