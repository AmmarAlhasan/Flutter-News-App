import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/helper/config/handler/request_status.dart';

class AuthErrorHandler {
  static void handle(RequestStatus status) {
    final messages = {
      RequestStatus.failure: ["Failure", "Something went wrong"],
      RequestStatus.emailFailure: ["Email Error", "Check your email again"],
      RequestStatus.passwordFailure: [
        "Password Error",
        "Check your password again"
      ],
      RequestStatus.credentialFailure: [
        "Error in Email or Password",
        "Check your Info again"
      ],
      RequestStatus.unAuth: ["Unauthorized", "You are not authorized"],
      RequestStatus.serverFailure: ["Server Error", "Please try again later"],
      RequestStatus.offlineFailure: [
        "Offline",
        "Check your internet connection"
      ],
    };

    final message = messages[status] ?? ["Error", "Unexpected error occurred"];

    showSnackBar(message[0], message[1]);
  }

  static void showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
