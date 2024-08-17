import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//
import '../All_Custom_Faction/APIURL.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import 'OtpController.dart';

class Otp_Screen extends StatelessWidget {
  final Otpcontroller controller = Get.put(Otpcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // Prevent the keyboard from resizing the screen
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
         color: AppColors.whitecolor
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.gradientcolor1.withOpacity(0.8),
                  AppColors.gradientcolor2.withOpacity(0.9),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verification code',
                    style: TextStyles.ProductSansBold5,
                  ),
                  Text(
                    'we have sent the verification code to your email address',
                    style: TextStyles.ProductSansRegular,
                  ),
                  SizedBox(height: 80),
                  PinCodeTextField(
                    controller: controller.mpinController,
                    appContext: context,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 2,
                      activeFillColor: Colors.white,
                      disabledColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: Colors.yellow,
                      selectedColor: AppColors.whitecolor,
                      errorBorderColor: Colors.red,
                      inactiveFillColor: Colors.white,
                      inactiveColor: AppColors.whitecolor,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 2),
                    ),
                    autoFocus: false,
                    keyboardType: TextInputType.number,
                    length: 4,
                    onChanged: (userInput) {},
                    onSubmitted: (userInput) {},
                    cursorColor: Colors.transparent,
                    textStyle: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'ProductSansBold',
                        color: AppColors.blackcolor
                    ),
                    backgroundColor: Colors.transparent,
                    mainAxisAlignment: MainAxisAlignment.center,
                    readOnly: false,
                    obscureText: false,
                  ),
                  GestureDetector(onTap: (){
                    controller.resendOtp();
                  },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Resend Otp?',
                        style: TextStyles.ProductSansRegular3,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    backgroundColor: AppColors.buttoncolor,
                    style: TextStyles.ProductSansBold3,
                    text: 'Done',
                    onTap: () {
                      controller.login(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
