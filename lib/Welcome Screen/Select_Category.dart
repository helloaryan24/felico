import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/SelectcategoryController.dart';

class Select_Category extends StatelessWidget {
  Select_Category({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          return CustomButton(
            backgroundColor: categoryController.selectedMaterial.value.isEmpty
                ? Colors.grey
                : AppColors.buttoncolor,
            style: TextStyles.ProductSansBold1,
            text: 'Save & Continue',
            onTap: categoryController.selectedMaterial.value.isEmpty
                ? () {}
                : () {
                    // Get.toNamed('/Select_Category');
                  },
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 0),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'Select Category',
                style: TextStyles.ProductSansBold,
              ), // Add some space at the top
              SizedBox(height: 10), // Add some space at the top
              Text(
                'Which Plastic Category you deal in?',
                style: TextStyles.ProductSansBold2,
              ),
              SizedBox(height: 20), // Add some space between text and wrap
              Center(
                child: Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(() {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            spacing: 15.0,
                            // Space between items
                            runSpacing: 15.0,
                            // Space between lines
                            children:
                                categoryController.materials.map((material) {
                              final isSelected =
                                  categoryController.selectedMaterial.value ==
                                      material['name'];
                              return GestureDetector(
                                onTap: () {
                                  categoryController.selectMaterial(
                                      material['name'] as String);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: isSelected
                                          ? AppColors.buttoncolor
                                          : Colors.grey.withOpacity(0.8),
                                      radius: 40,
                                      // Adjust the size of the icon
                                      backgroundImage: AssetImage(
                                          material['image'] as String),
                                    ),
                                    SizedBox(height: 5),
                                    // Space between icon and text
                                    Text(
                                      material['name'] as String,
                                      style: TextStyles.ProductSansRegular1,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 10),
                          // Add space between Wrap and selected item text
                          // Show selected item name
                        ],
                      );
                    }),
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
