import 'package:felico/All_Custom_Faction/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/NameInputController.dart';

class NameInputScreen extends StatelessWidget {
  final NameInputController controller = Get.put(NameInputController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomButton(
            backgroundColor: AppColors.buttoncolor,
            style: TextStyles.ProductSansBold1,
            text: 'Next',
            onTap: () {
              Get.toNamed('/Gst_Screen');
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100), // Add some space at the top
                Text(
                  'Enter Your Name',
                  style: TextStyles.ProductSansBold,
                ),
                SizedBox(height: 10),
                Text(
                  'Enter details to see right price from verified buyers!',
                  style: TextStyles.ProductSansRegular1,
                ),
                SizedBox(height: 80),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your name as per Aadhaar',
                    style: TextStyles.ProductSansRegular1,
                  ),
                ),
                SizedBox(height: 10),
                buildInputField(
                  hintText: 'Enter your full name here',
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 100), // Add some space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
