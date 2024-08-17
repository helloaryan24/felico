import 'dart:io';

import 'package:felicodriver/All_Custom_Faction/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart'; // Import this for FilteringTextInputFormatter

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/OtpController.dart';
import '../Controller/TaskController.dart';

class Verificationcode_Page extends StatelessWidget {
  Verificationcode_Page({super.key});
  var tasks = <Task>[].obs; // Observable list to hold tasks

  // Initialize the OtpController
  final OtpController otpController = Get.put(OtpController());




  // Initialize the OtpController

  Future<void> _showCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      otpController.addImagePath(pickedFile.path);
    }
    Navigator.pop(context); // Close the bottom sheet or dialog
  }

  void _showTruckImagePrompt(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors.whitecolor,
          insetPadding: EdgeInsets.all(20),
          content: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50, width: 50,
                      child: Lottie.asset(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        animate: true,
                        Images.error,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Attention Truck Images Required!',
                        style: TextStyles.ProductSansBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Please take 4 pictures of the truck that will transport the package.',
                  style: TextStyles.ProductSansRegular4,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Images.truck1, height: 60, width: 60,),
                    Image.asset(Images.truck2, height: 60, width: 60,),
                    Image.asset(Images.truck3, height: 60, width: 60,),
                    Image.asset(Images.truck4, height: 60, width: 60,),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CustomButton(
              backgroundColor: AppColors.buttoncolor,
              style: TextStyles.ProductSansBold3,
              text: 'Proceed',
              onTap: () {
                FocusScope.of(context).unfocus(); // Dismiss the keyboard
                _showCamera(context); // Open the camera
              },
            ),
          ],
        );
      },
    );
  }
  final String dropLocation = Get.arguments['drop_location'] ?? '';
  final String orderId = Get.arguments['Order_no'] ?? '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter The “OTP” To Verify Your Pickup",
              style: TextStyles.ProductSansBold7,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // OTP Fields
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: _buildOtpTextField(context, index),
                        );
                      }),
                    ),
                  ),
                  SizedBox(width: 10), // Space between OTP fields and button
                  // Verify Button
                  CustomButton(
                    backgroundColor: AppColors.buttoncolor,
                    style: TextStyles.ProductSansBold3,
                    text: 'Verify',
                    onTap: () {
                      otpController.submitOtp(orderId);  // Pass orderId here
                    },
                  ),
                ],
              )),
            ),
            Divider(height: 20, thickness: 1, indent: 0, endIndent: 0, color: Colors.grey,),
            SizedBox(
              height: 20,
            ),
            Text(
              'Carrier images',
              style: TextStyles.ProductSansBold,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Provide minimum 1 photos of your material',
              style: TextStyles.ProductSansRegular4,
            ),
            SizedBox(height: 20),
             GestureDetector(
              onTap: () {
                if (otpController.isOtpVerified.value) {
                  if (otpController.isOtpValid()) {
                    _showTruckImagePrompt(context);
                  } else {
                    showSuccessSnackbar(
                      'Please verify OTP before taking photos.',
                      icon: Icons.error_outline,
                      iconColor: Colors.red,
                      containerColor: Colors.red,
                    );
                  }
                } else {
                  showSuccessSnackbar(
                    'Please verify OTP before taking photos.',
                    icon: Icons.error_outline,
                    iconColor: Colors.red,
                    containerColor: Colors.red,
                  );
                }
              },// Disable the button if OTP is not verified
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 2, color: AppColors.gradientcolor1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.camera_fill,
                          color: AppColors.gradientcolor1,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Take Materials Photos",
                          style: TextStyles.ProductSansBold2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                        Expanded(
              child: Obx(
                    () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: otpController.selectedImagePaths.length,
                  itemBuilder: (context, index) {
                    if (index < 0 || index >= otpController.selectedImagePaths.length) {
                      return Container();
                    }
                    String imagePath = otpController.selectedImagePaths[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(File(imagePath)),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color:  AppColors.gradientcolor1.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              otpController.removeImagePath(imagePath);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),          SizedBox(height: 5,),
            Text(
              'Drop Location:\n$dropLocation', // Display drop_location
              style: TextStyles.ProductSansBold,
            ),
          SizedBox(height: 5,),
            CustomButton(
              backgroundColor: AppColors.buttoncolor,
              style: TextStyles.ProductSansBold3,
              text: 'Save & Continue',
              onTap: () {
                // First, check if the order is valid (e.g., orderId is not empty)
                if (orderId.isNotEmpty) {
                  // Show a confirmation dialog to the user
                  showDialog(
                    context: context,
                    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
                    builder: (BuildContext context) {
                      // Controller for the comments text field
                      TextEditingController commentsController = TextEditingController();
                      // Boolean to track the checkbox state
                      bool isChecked = false;

                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(

                            title: Text('Confirm\nMaterials Received',style: TextStyles.ProductSansBold7,),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 50,height: 50,
                                      child: Checkbox(
                                        value: isChecked,activeColor: AppColors.gradientcolor1,

                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value ?? false;
                                          });
                                        },
                                      ),
                                    ),
                                    Text('Have you\nreceived all the materials?',style: TextStyles.ProductSansRegular4,),
                                  ],
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: commentsController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyles.ProductSansRegular2,
hintText: "Add Comments"
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              CustomButton(
                                backgroundColor: AppColors.buttoncolor,
                                style: TextStyles.ProductSansBold3,
                                text: 'Done',
                                onTap: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                  if (isChecked) {
                                    // Proceed with the API call after confirming and adding comments
                                    if (otpController.selectedImagePaths.length >= 1) {
                                      otpController.uploadImages(
                                        otpController.selectedImagePaths,
                                        dropLocation,
                                      );
                                    } else {
                                      showSuccessSnackbar(
                                        'Please add at least 1 image.',
                                        icon: Icons.error_outline,
                                        iconColor: Colors.red,
                                        containerColor: Colors.red,
                                      );
                                    }
                                  } else {
                                    // Send only comments without proceeding with image upload
                                    // otpController.sendComments(
                                    //   commentsController.text.trim(), // Pass the comments
                                    // );
                                  }
                                  },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                } else {
                  // Show a message if the order is not valid or not received
                  showSuccessSnackbar(
                    'Order not received or invalid. Please try again.',
                    icon: Icons.error_outline,
                    iconColor: Colors.red,
                    containerColor: Colors.red,
                  );
                }
              },
            ),


          ],
        ),
      ),
    );
  }

  // Method to build a single OTP input field
  Widget _buildOtpTextField(BuildContext context, int index) {
    return SizedBox(
      width: 35,
      height: 50,
      child: TextField(
        controller: otpController.otpTextControllers[index],
        focusNode: otpController.focusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Restrict input to digits
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        cursorColor: AppColors.blackcolor,
        cursorHeight: 0,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          counterText: '', // Hide the character counter
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.gradientcolor1, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.gradientcolor1, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 3) {
              otpController.focusNodes[index + 1].requestFocus(); // Move to next field
            } else {
              // Check if all fields are filled
              bool allFilled = otpController.otpTextControllers
                  .every((controller) => controller.text.isNotEmpty);
              if (allFilled) {
                FocusScope.of(context).unfocus(); // Dismiss the keyboard
              }
            }
          } else if (value.isEmpty && index > 0) {
            otpController.focusNodes[index - 1].requestFocus(); // Move to previous field
          }
        },
      ),
    );
  }}
