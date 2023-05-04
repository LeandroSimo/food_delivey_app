import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/app/modules/login_register/pages/page_login.dart';
import 'package:food_delivery_app/app/modules/login_register/pages/page_register.dart';
import 'package:food_delivery_app/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Duration initialDelay = const Duration(seconds: 1);

  bool isVisibility = false;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  getPage() {
    if (_currentPage < 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/food_pattern.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              orange,
              BlendMode.screen,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: DelayedDisplay(
                delay: initialDelay,
                slidingBeginOffset: const Offset(0, -2),
                slidingCurve: Curves.decelerate,
                child: Center(
                  child: Text(
                    'Foodies',
                    style: GoogleFonts.poppins(
                      fontSize: 70.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: DelayedDisplay(
                slidingBeginOffset: const Offset(0, 2),
                slidingCurve: Curves.decelerate,
                delay: initialDelay,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          PageLogin(
                            duration: initialDelay,
                            func: getPage,
                            isVisibility: isVisibility,
                          ),
                          PageRegister(
                            func: getPage,
                            duration: initialDelay,
                            isVisibility: isVisibility,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
