import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/SignupPageController.dart';

class SignupPage_Screen extends StatelessWidget {
  final SignuppageController controller = Get.put(SignuppageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title at the top
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let’s Get',
                      style: TextStyles.ProductSansRegular5,
                    ),
                    Text(
                      'Started',
                      style: TextStyles.ProductSansBold1,
                    ),
                  ],
                ),
                Image.asset(
                  Images.carlogo,
                ),
              ],
            ),
            SizedBox(height: 50,),
            Container(
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyles.ProductSansBold5,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Username or Email address',
                      style: TextStyles.ProductSansRegular6,
                    ),
                    SizedBox(height: 10),
                    buildInputField(
                      hintText: 'Enter email here..',
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Password',
                      style: TextStyles.ProductSansRegular6,
                    ),
                    SizedBox(height: 10),
                    buildInputField(
                      hintText: 'Enter Password here..',
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Confirm Password',
                      style: TextStyles.ProductSansRegular6,
                    ),
                    SizedBox(height: 10),

                    buildInputField(
                      hintText: 'Enter confirm Password here..',
                      controller: controller.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      backgroundColor: AppColors.buttoncolor,
                      style: TextStyles.ProductSansBold3,
                      text: 'Sign up',
                      onTap: () {
                        controller.login(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                controller.haveaccount(context);
              },
              child: Align(alignment: Alignment.center,
                child: Text(
                  'Already have an account? Log In',
                  style: TextStyles.ProductSansBold6,
                ),
              ),
            ),
            Spacer(), // Spacer to balance out the remaining space
          ],
        ),
      ),
    );
  }
}
