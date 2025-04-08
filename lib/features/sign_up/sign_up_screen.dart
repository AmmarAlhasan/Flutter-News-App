import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/config/responsive_config.dart';
import '../../widgets/forms/sign_up_form.dart';
import 'sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/SignUpScreen';

  final SignUpController controller = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Sign Up",
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: responsive.screenWidth < 600
                    ? responsive.screenWidth * 0.9
                    : 400,
              ),
              padding: EdgeInsets.all(
                responsive.horizontalPadding,
              ),
              width: responsive.containerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: responsive.verticalSpacing,
                    ),
                    child: Obx(
                      () => controller.isLoading.value
                          ? Text(
                              "Loading...",
                              style: TextStyle(
                                fontSize:
                                    responsive.screenWidth < 400 ? 18 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Create your account",
                              style: TextStyle(
                                fontSize:
                                    responsive.screenWidth < 400 ? 18 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  SignUpForm(
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
