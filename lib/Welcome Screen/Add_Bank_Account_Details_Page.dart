import 'package:felico/All_Custom_Faction/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/TextStyle.dart';

class AddBankAccountDetails_Page extends StatelessWidget {
  const AddBankAccountDetails_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              Get.toNamed('/PuchaseAgreement_Page');
            },
            child: Text(
              'Do it Later',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.amber,
                  fontFamily: 'ProductSansBold',
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100), // Add some space at the top
                Text(
                  'Add Bank Account Details',
                  style: TextStyles.ProductSansBold,
                ),
                SizedBox(height: 10),
                Text(
                  'Congratulations! You are just a few steps away from using your business line!',
                  style: TextStyles.ProductSansRegular,
                ),
                SizedBox(height: 60),
                CustomListTile(),
                SizedBox(height: 20), // Add spacing between widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttoncolor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.account_balance,
            size: 40.0,
            color: AppColors.iconcolor,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bank Account Details',
                  style: TextStyles.ProductSansBold2,
                ),
                SizedBox(height: 5.0),
                Text(
                  'A/C, Upload canceled cheque photo',
                  style: TextStyles.ProductSansRegular4,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20.0,
            color: AppColors.iconcolor,
          ),
        ],
      ),
    );
  }
}
