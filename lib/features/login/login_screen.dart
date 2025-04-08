import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/config/responsive_config.dart';
import '../../widgets/forms/login_form.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/Login_Screen';

  final LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Login",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: responsive.containerWidth,
              padding: EdgeInsets.all(responsive.horizontalPadding),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: responsive.verticalSpacing,
                    ),
                    child: Obx(
                      () => controller.isLoading.value
                          ? Text(
                              'Loading...',
                              style: TextStyle(
                                fontSize:
                                    responsive.screenWidth < 400 ? 18 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Login to your account",
                              style: TextStyle(
                                fontSize:
                                    responsive.screenWidth < 400 ? 18 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  LoginForm(
                    controller: controller,
                    formKey: _formKey,
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
