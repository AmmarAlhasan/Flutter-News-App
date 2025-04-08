import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/config/handler/auth_error_handler.dart';
import '../../model/user.dart';
import '../news/news_screen.dart';
import 'sign_up_service.dart';

class SignUpController extends GetxController {
  SignUpService service = SignUpService();

  late User user;

  var confirmPasswordVisible = true.obs;
  late RxBool passwordVisible;
  RxBool isVisible = true.obs;
  late RxBool isLoading;

  @override
  void onInit() {
    user = User(
      userName: '',
      email: '',
      password: '',
      confirmPassword: '',
    );

    passwordVisible = false.obs;
    isLoading = false.obs;

    super.onInit();
  }

  void changePasswordIcon() {
    passwordVisible(!(passwordVisible.value));
  }

  void changeConfirmPasswordIcon() {
    confirmPasswordVisible(
      !(confirmPasswordVisible.value),
    );
  }

  void togglePasswordVisibility() {
    passwordVisible(!(passwordVisible.value));
  }

  Future<void> signUpWithEmail(User user) async {
    isLoading.value = true;
    try {
      var result = await service.registerWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      result.fold((error) {
        AuthErrorHandler.handle(error);
        isLoading.value = false;
      }, (user) {
        print(user?.email);
        print(user?.emailVerified);
        Get.snackbar(
          "Success",
          "Account created successfully",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueAccent,
        );
        isLoading.value = false;
        Get.offAllNamed(NewsScreen.routeName);
      });
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}
