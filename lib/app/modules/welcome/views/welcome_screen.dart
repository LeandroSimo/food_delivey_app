import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/modules/login_register/views/login_screen.dart';
import 'package:food_delivery_app/app/modules/welcome/widgets/custom_clipper_widget.dart';
import 'package:food_delivery_app/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: orange.withAlpha(150),
            child: Image.asset(
              'assets/food_pattern.png',
              repeat: ImageRepeat.repeatY,
              color: orange,
            ),
          ),
          Positioned(
            top: 25,
            child: Image.asset(
              'assets/welcome/chef.png',
              width: 250.w,
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            child: Image.asset(
              'assets/welcome/bassil.png',
              width: 80.w,
            ),
          ),
          Positioned(
            top: 300,
            right: 30,
            child: Image.asset(
              'assets/welcome/chili.png',
              width: 80.w,
            ),
          ),
          Positioned(
            top: 200,
            left: -10,
            child: Image.asset(
              'assets/welcome/mushrooms.png',
              width: 90.w,
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                color: white,
                padding: const EdgeInsets.only(
                    top: 40, right: 50, left: 50, bottom: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: poppins.copyWith(
                          fontSize: 37.sp,
                          fontWeight: FontWeight.w900,
                        ),
                        children: [
                          TextSpan(
                            text: 'The Fastest In Delivery ',
                            style: poppins.copyWith(color: black),
                          ),
                          TextSpan(
                            text: 'Food',
                            style: poppins.copyWith(color: red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 33.h),
                    Text(
                      'Our job is to filling yout tummy with delicious food and fast delivery',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(
                        fontSize: 16.sp,
                        color: black,
                      ),
                    ),
                    SizedBox(height: 33.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          3,
                          (index) => Container(
                            width: index == 0 ? 30 : 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: index == 0 ? orange : greyLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 37.h),
                    MaterialButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, LoginScreen.route),
                      color: red,
                      height: 82.h,
                      minWidth: 272.w,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Get Started',
                        style: poppins.copyWith(
                          fontSize: 25.sp,
                          color: white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
