import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'All_Widget.dart';
import 'Image.dart';

class ApiUrls {
  static const String MainUrl = 'https://felicoapis.devashishsoni.site/api/';

  static const String registerapi = '${MainUrl}send-otp';
  static const String verifyotpapi = '${MainUrl}verify-otp';
  static const String resendotpapi = '${MainUrl}resend-otp';
  static const String confirmcode = '${MainUrl}confirm-code';
  static const String tasks = '${MainUrl}tasks';
  static const String googlemapurl = 'https://www.google.com/maps/dir/?api=1&destination=';
  // static const String billingapi = '${MainUrl}billings';
  // static const String aadquantity = '${MainUrl}add-quantity';
  static const String courierimages = '${MainUrl}courier-images';


  static const String getmaterial = '${MainUrl}select-materials';
}

class AllApiFaction extends GetxController {

  Future<void> loginUp(String email, BuildContext context) async {
    print(email);
    print(ApiUrls.registerapi);
    Get.dialog(
      lottieAnimation(context),
      barrierDismissible: false, // Prevent dismissing by tapping outside
    );
    try {
      final String signUpUrl = ApiUrls.registerapi;
      final signUpResponse = await http.post(
        Uri.parse(signUpUrl),
        body: {
          'email': email,
        },
      );
      if (signUpResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(signUpResponse.body);
        final success = jsonResponse['success'];
        print(success);
        if (success == true) {
          Get.back();
          final message = jsonResponse['message'];
          print(message);
          showSuccessSnackbar(message,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              containerColor: Colors.green);
          Get.toNamed('/Otp_Screen', arguments: {
            'email': email,
          });
        } else {
          print('else');
          Get.back();
          final message = jsonResponse['message'];
          showSuccessSnackbar(message,
              icon: Icons.error_outline,
              iconColor: Colors.red,
              containerColor: Colors.red);
        }
      } else {
        Get.back();
        print('HTTP Error: ${signUpResponse.statusCode}');
        // Handle non-200 status code
        showSuccessSnackbar('An error occurred while processing your request',
            icon: Icons.error_outline,
            iconColor: Colors.red,
            containerColor: Colors.red);
      }
    } catch (e) {
      Get.back();
      showSuccessSnackbar('An error occurred while processing your request',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red);
      print('Exception occurred: $e');
    }
  }

  Future<void> confirmOtp(String otp, BuildContext context) async {
    final Map<String, dynamic> args = Get.arguments;
    final String email = args['email'];
    print('Email: $email');
    print('OTP: $otp');
    print('API URL: ${ApiUrls.verifyotpapi}');

    Get.dialog(
      lottieAnimation(context),
      barrierDismissible: false, // Prevent dismissing by tapping outside
    );

    try {
      final int otpInt = int.parse(otp); // Convert OTP to integer
      final String confirmOtpUrl = ApiUrls.verifyotpapi;
      final confirmOtpResponse = await http.post(
        Uri.parse(confirmOtpUrl),
        body: {'email': email, 'otp': otpInt.toString()}, // Send OTP as string
      );

      print('Response Status Code: ${confirmOtpResponse.statusCode}');
      print('Response Body: ${confirmOtpResponse.body}');

      if (confirmOtpResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(confirmOtpResponse.body);
        final success = jsonResponse['success'];
        print('Success: $success');

        Get.back(); // Dismiss loading dialog

        if (success == true) {
          final message = jsonResponse['message'];
          print('Message: $message');
          showSuccessSnackbar(message,
              icon: Icons.check_circle,
              iconColor: Colors.green,
              containerColor: Colors.green);

          // Save login status in shared preferences
          print("SharedPreferences");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('userEmail', email); // Save email

          // Navigate to the next screen
          Get.offAllNamed('/Task_Page');
        } else {
          final message = jsonResponse['message'];
          print('Error Message: $message');
          showSuccessSnackbar(message,
              icon: Icons.error_outline,
              iconColor: Colors.red,
              containerColor: Colors.red);
        }
      } else {
        Get.back(); // Dismiss loading dialog
        print(
            'Failed to verify OTP. Status Code: ${confirmOtpResponse.statusCode}');
        showSuccessSnackbar('Failed to verify OTP. Please try again.',
            icon: Icons.error_outline,
            iconColor: Colors.red,
            containerColor: Colors.red);
      }
    } catch (e) {
      Get.back(); // Dismiss loading dialog
      showSuccessSnackbar('An error occurred while processing your request',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red);
      print('Exception occurred: $e');
    }
  }

}
