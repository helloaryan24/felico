import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Image.dart';
import 'package:http/http.dart' as http;

class Logincontoller extends GetxController {
  var email = ''.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      showErrorDialog('Email field is empty');
      return;
    }
    if (!EmailValidator.validate(email)) {
      showErrorDialog('Invalid email address');
      return;
    }
    await AllApiFaction().loginUp(
        email, context);

    // Navigate to the next page
    Get.toNamed('/Otp_Screen', arguments: {
      'email': email,
    });
  }

  void showErrorDialog(String message) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.all(0),
        content: AlertDialogBox(
          message: message,
        ),
      ),
    );
  }
}

