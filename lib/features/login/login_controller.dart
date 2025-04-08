import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/config/handler/auth_error_handler.dart';
import '../../model/user.dart';
import '../news/news_screen.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  late User user;

  late RxBool passwordVisible;
  late RxBool isLoading;
  RxBool isVisible = true.obs;

  late LoginService service;

  @override
  void onInit() {
    user = User(
      id: '',
      userName: '',
      email: '',
      password: '',
      confirmPassword: '',
    );

    passwordVisible = false.obs;
    isLoading = false.obs;

    service = LoginService();
    super.onInit();
  }

  void changePasswordIcon() {
    passwordVisible(!(passwordVisible.value));
  }

  void togglePasswordVisibility() {
    passwordVisible(!(passwordVisible.value));
  }

  Future<void> loginWithEmail(User user) async {
    isLoading.value = true;
    print('in login controller');
    print(user.email);
    print(user.password);
    try {
      var result = await service.signInWithEmailAndPassword(
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
          "Logged in successfully",
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

  Future<void> loginWithGoogle(User user) async {
    print(user.email);
    print(user.password);

    try {
      var googleUser = await service.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      Get.snackbar("Success", "Logged in with Google successfully");
      //Get.offNamed(UserHomeScreen.routeName);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
