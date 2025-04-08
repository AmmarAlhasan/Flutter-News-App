import 'package:flutter/material.dart';
import '../features/login/login_screen.dart';
import '../features/sign_up/sign_up_screen.dart';
import '../helper/config/responsive_config.dart';

import '../widgets/common/custom_registration_button.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/Registration_Screen';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Eyego Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: responsive.screenWidth < 400 ? 24 : 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2196F3),
              Color(0xFF64B5F6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.horizontalPadding,
            ),
            child: Container(
              padding: EdgeInsets.all(
                responsive.horizontalPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(
                  responsive.borderRadius,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_user_rounded,
                    size: responsive.screenWidth * 0.25,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    height: responsive.verticalSpacing,
                  ),
                  Text(
                    'Welcome to Eyego!',
                    style: TextStyle(
                      fontSize: responsive.screenWidth < 400 ? 22 : 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: responsive.verticalSpacing * 0.5,
                  ),
                  Text(
                    'Choose an option to get started.',
                    style: TextStyle(
                      fontSize: responsive.screenWidth < 400 ? 14 : 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: responsive.verticalSpacing * 2,
                  ),
                  CustomRegistrationButton(
                    text: "Login",
                    icon: Icons.login_rounded,
                    destination: LoginScreen.routeName,
                    responsiveConfig: responsive,
                  ),
                  SizedBox(
                    height: responsive.verticalSpacing,
                  ),
                  CustomRegistrationButton(
                    text: "Sign Up",
                    icon: Icons.person_add_alt_1_rounded,
                    destination: SignUpScreen.routeName,
                    responsiveConfig: responsive,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
