import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_delivery_app/app/modules/login_register/views/login_screen.dart';
import 'package:food_delivery_app/app/modules/splash_screen/splash_screen.dart';
import 'package:food_delivery_app/data/service/auth/firebase_autentication.dart';
import 'package:food_delivery_app/shared/drawer/menu_dawer.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAutentication().authStateChanges,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is InitState) {
              return const SplashScreen();
            }
            if (state is LoggedInState) {
              return const HomeDrawerMenu();
            }
            if (state is LoggedOutState) {
              return const LoginScreen();
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
