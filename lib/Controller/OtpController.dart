import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';

class OtpController extends GetxController {
  final otpTextControllers = List.generate(4, (_) => TextEditingController()).obs;
  var selectedImagePaths = <String>[].obs;

  void addImagePath(String imagePath) {
    selectedImagePaths.add(imagePath);
    update();
  }

  var isOtpVerified = false.obs;

  void setOtpVerified(bool value) {
    isOtpVerified.value = value;
    update();
  }
  void removeImagePath(String imagePath) {
    selectedImagePaths.remove(imagePath);
    update();
  }

  void _showLoadingDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(
        lottieAnimation(Get.context!),
        barrierDismissible: false,
      );
    });
  }

  void _hideLoadingDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.back();
    });
  }

  Future<void> uploadImages(List<String> imagePaths, String dropLocation) async {
    // _showLoadingDialog();
    try {
      var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.courierimages));
      for (var imagePath in imagePaths) {
        request.files.add(await http.MultipartFile.fromPath(
          'images',
          imagePath,
          contentType: MediaType('image', 'jpeg'),
        ));
      }
      var response = await request.send();
      if (response.statusCode == 201) {
        showSuccessSnackbar(
          'Images uploaded successfully',
          icon: Icons.check_circle,
          iconColor: Colors.green,
          containerColor: Colors.green,
        );

        // _hideLoadingDialog();  // Hide the dialog before navigation

        // Get.to(Droping_page(), arguments: {'drop_location': dropLocation});
      } else {
        showErrorSnackbar('Failed to upload images');
        _hideLoadingDialog();  // Hide the dialog before navigation

      }
    } catch (e) {
      showErrorSnackbar('An error occurred: $e');
    } finally {
      if (Get.isDialogOpen ?? false) {
        _hideLoadingDialog();
      }
      // _hideLoadingDialog();  // Hide the dialog before navigation

    }
  }

  final focusNodes = List.generate(4, (_) => FocusNode()).obs;
  final otp = ''.obs;

  void submitOtp(String orderId) {
    otp.value = otpTextControllers.map((controller) => controller.text).join();

    if (isOtpValid()) {
      confirmCode(orderId);
    } else {
      showSuccessSnackbar(
        'Please enter a valid 4-digit OTP',
        icon: Icons.error_outline,
        iconColor: Colors.red,
        containerColor: Colors.red,
      );
    }
  }

  bool isOtpValid() {
    String otpString = otp.value; // Convert RxString to String
    return otpString.length == 4 && otpTextControllers.every((controller) => controller.text.isNotEmpty);
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  Future<void> confirmCode(String orderId) async {
    _showLoadingDialog();

    print(orderId);
    print(otp.value);
    try {
      // final email = await getEmail();
      // if (email == null) {
      //   _showErrorDialog('No email found. Please provide an email address.');
      //   return;
      // }
      // print(email);
      final response = await http.post(
        Uri.parse(ApiUrls.confirmcode),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'order_id': orderId, 'code': otp.value}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);
        final message = responseData['message'];
        print(message);
        showSuccessSnackbar(
          message,
          icon: Icons.check_circle,
          iconColor: Colors.green,
          containerColor: Colors.green,
        );
        setOtpVerified(true); // Set OTP verified to true
        // Handle successful response
      } else {
        showSuccessSnackbar(
          'Failed OTP. Please try again.',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red,
        );
        setOtpVerified(false); // Set OTP verified to false
      }
    } catch (e) {
      showSuccessSnackbar(
        'An error occurred while processing your request.',
        icon: Icons.error_outline,
        iconColor: Colors.red,
        containerColor: Colors.red,
      );
    } finally {
      _hideLoadingDialog();
    }
  }
  void sendComments(String comments) async {
    // Show loading dialog
    _showLoadingDialog();

    try {
      final response = await http.post(
        Uri.parse(""),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'comments': comments}),
      );

      if (response.statusCode == 200) {
        showSuccessSnackbar(
          'Comments sent successfully',
          icon: Icons.check_circle,
          iconColor: Colors.green,
          containerColor: Colors.green,
        );
      } else {
        showErrorSnackbar('Failed to send comments');
      }
    } catch (e) {
      showErrorSnackbar('An error occurred: $e');
    } finally {
      _hideLoadingDialog();
    }
  }

}
