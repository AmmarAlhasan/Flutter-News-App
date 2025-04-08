import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/login/login_controller.dart';
import '../../features/sign_up/sign_up_screen.dart';
import '../../helper/config/responsive_config.dart';
import '../../model/user.dart';
import '../common/custom_field.dart';
import '../common/password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
    required this.responsiveConfig,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final LoginController controller;
  final ResponsiveConfig responsiveConfig;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            )
          : Form(
              key: formKey,
              child: Column(
                children: [
                  CustomField(
                    labelText: "Email",
                    hintText: "Enter your Email",
                    icon: Icons.person,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty || value.length <= 2) {
                        return "Invalid input!";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.user.email = value!;
                    },
                    responsiveConfig: responsiveConfig,
                  ),
                  SizedBox(height: responsiveConfig.verticalSpacing),
                  Obx(() {
                    return PasswordField(
                      isVisible: controller.isVisible.value,
                      passwordVisible: controller.passwordVisible.value,
                      labelText: "Password",
                      hintText: "Enter your password",
                      icon: Icons.lock,
                      suffixIcon: IconButton(
                        onPressed: controller.changePasswordIcon,
                        icon: Icon(
                          controller.passwordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: responsiveConfig.iconSize,
                          color: controller.passwordVisible.value
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                      textInputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Enter at least 6 characters!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.user.password = value!;
                      },
                      responsiveConfig: responsiveConfig,
                    );
                  }),
                  SizedBox(height: responsiveConfig.verticalSpacing),
                  SizedBox(
                    width: responsiveConfig.containerWidth * 0.65,
                    child: ElevatedButton(
                      onPressed: () => _submit(context, controller.user),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              responsiveConfig.borderRadius),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: responsiveConfig.verticalSpacing * 0.6,
                          horizontal: responsiveConfig.horizontalPadding * 1.5,
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: responsiveConfig.buttonFontSize - 2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveConfig.verticalSpacing),
                  SizedBox(
                    width: responsiveConfig.containerWidth * 0.65,
                    child: ElevatedButton.icon(
                      icon: Image.asset(
                        'assets/images/Google_Icon.webp',
                        height: responsiveConfig.iconSize + 2,
                        width: responsiveConfig.iconSize + 2,
                      ),
                      label: Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: responsiveConfig.buttonFontSize - 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () =>
                          controller.loginWithGoogle(controller.user),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              responsiveConfig.borderRadius),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: responsiveConfig.verticalSpacing * 0.6,
                          horizontal: responsiveConfig.horizontalPadding * 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveConfig.verticalSpacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: responsiveConfig.buttonFontSize - 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(SignUpScreen.routeName);
                        },
                        child: Text(
                          "Create one",
                          style: TextStyle(
                            fontSize: responsiveConfig.buttonFontSize - 2,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _submit(BuildContext context, User user) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await controller.loginWithEmail(user);
    }
  }
}
