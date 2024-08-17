import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/LoginContoller.dart';

class Login_Screen extends StatelessWidget {
  final Logincontoller controller = Get.put(Logincontoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 0),
          child: Column(

            children: [
              // Logo and Name at the top
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      height: 50, // Adjust size if needed
                    ),
                  ],
                ),
              ),
              // Centered Container with Login Form
              SizedBox(height: 50,),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400), // Maximum width of the container
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log In',
                        style: TextStyles.ProductSansBold5,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Email address',
                        style: TextStyles.ProductSansRegular6,
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Enter email here..',
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 30),
                      CustomButton(
                        backgroundColor: AppColors.buttoncolor,
                        style: TextStyles.ProductSansBold3,
                        text: 'Log in',
                        onTap: () {
                          controller.login(context);
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
