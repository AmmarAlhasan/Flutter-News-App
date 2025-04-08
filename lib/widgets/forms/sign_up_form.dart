import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/login/login_screen.dart';
import '../../features/sign_up/sign_up_controller.dart';
import '../../helper/config/responsive_config.dart';
import '../../model/user.dart';
import '../common/custom_field.dart';
import '../common/password_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.controller,
    required this.responsiveConfig,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final SignUpController controller;
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
                  SizedBox(
                    height: responsiveConfig.verticalSpacing,
                  ),
                  Obx(() {
                    return PasswordField(
                      isVisible: controller.isVisible.value,
                      passwordVisible: controller.passwordVisible.value,
                      labelText: "Password",
                      hintText: "Enter your password",
                      icon: Icons.lock,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changePasswordIcon();
                        },
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
                  SizedBox(
                    height: responsiveConfig.verticalSpacing,
                  ),
                  SizedBox(
                    width: responsiveConfig.containerWidth * 0.65,
                    child: ElevatedButton(
                      onPressed: () => _submit(
                        context,
                        controller.user,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: responsiveConfig.verticalSpacing,
                          horizontal: responsiveConfig.horizontalPadding * 2.5,
                        ),
                      ),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          fontSize: responsiveConfig.buttonFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: responsiveConfig.buttonFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(
                            LoginScreen.routeName,
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: responsiveConfig.buttonFontSize + 0.2,
                            fontWeight: FontWeight.w900,
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
      await controller.signUpWithEmail(user);
    }
  }
}
