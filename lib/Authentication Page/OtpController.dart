import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';

class Otpcontroller extends GetxController {
  final mpinController = TextEditingController();
  final pin = ''.obs;

  @override
  void dispose() {
    mpinController.dispose();
    super.dispose();
  }

  void onPinChanged(String userInput) {
    pin.value = userInput;
  }

  Future<void> login(BuildContext context) async {
    final otp = mpinController.text.trim();
    if (otp.isEmpty) {
      _showErrorDialog('Otp field is empty');
      return;
    }

    await AllApiFaction().confirmOtp(otp, context);

  }


  Future<void> resendOtp() async {
    try {
      final args = Get.arguments as Map<String, dynamic>?;
      final email = args?['email'];
      if (email == null) {
        _showErrorDialog('Missing email argument');
        return;
      }

      final response = await http.post(Uri.parse(ApiUrls.resendotpapi), body: {'email': email});
      final success = response.statusCode == 200;

      showSuccessSnackbar(
        success ? "OTP sent. Please check your email." : 'Failed to resend OTP. Please try again.',
        icon: success ? Icons.check_circle : Icons.error_outline,
        iconColor: success ? Colors.green : Colors.red,
        containerColor: success ? Colors.green : Colors.red,
      );
    } catch (e) {
      showSuccessSnackbar('An error occurred while processing your request.',
        icon: Icons.error_outline,
        iconColor: Colors.red,
        containerColor: Colors.red,
      );
    }
  }

  void _showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.all(0),
        content: AlertDialogBox(message: message),
      ),
      barrierDismissible: false,
    );
  }
}
