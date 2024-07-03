import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../All_Custom_Faction/TextStyle.dart';

class PuchaseAgreement_Page extends StatelessWidget {
  const PuchaseAgreement_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/SelectMaterial_Page');
          },
          child: Text(
            'Skip',
            style: TextStyle(
                fontSize: 15,
                color: Colors.amber,
                fontFamily: 'ProductSansBold',
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Add some space at the top
            Text(
              'Puchase Agreement',
              style: TextStyles.ProductSansBold,
            ),
            SizedBox(height: 20), // Add some space at the top
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyles.ProductSansRegular,
            ),
            SizedBox(height: 20), // Add some space at the top
            Text(
              'Repidue Technology Private Limited',
              style: TextStyles.ProductSansBold2,
            ),
            SizedBox(height: 20), // Add some space at the top
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyles.ProductSansRegular,
            ),
            SizedBox(height: 10), // Add some space at the top
            // Text('OK',style: TextStyles.ProductSansRegular,),
          ],
        ),
      ),
    ));
  }
}
