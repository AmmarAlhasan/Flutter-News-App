import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'registration_screen.dart';

class MainSplashScreen extends StatelessWidget {
  static const String routeName = '/Splash_Screen';

  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset("assets/images/source safe logo.png"),
        logoWidth: 300,
        //logo size before
        showLoader: false,
        durationInSeconds: 3,
        navigator: const RegistrationScreen(),
      ),
    );
  }
}
