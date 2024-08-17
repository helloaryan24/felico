import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/TaskController.dart';

class Task_Page extends StatelessWidget {
  Task_Page({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TaskController controller = Get.put(TaskController());

    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Today's Task",
                  style: TextStyles.ProductSansRegular1,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    controller.reloadData();
                  },
                  child: Icon(
                    Icons.restart_alt,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    controller.clearAllAddresses();
                    Get.offAllNamed('/Login_Screen');
                  },
                  child: Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.red,
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.tasks.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    final task = controller.tasks[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 1,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Images.order,
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Order no ${task.orderId}',
                                        style: TextStyles.ProductSansBold2,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Material: Plastic, Metal, Paper, E-waste',
                                        style: TextStyles.ProductSansRegular2,
                                      ),
                                      SizedBox(height: 4),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Qty', style: TextStyles.ProductSansRegular4),
                                SizedBox(width: 5),
                                Text('${task.totalQuantity} MT', style: TextStyles.ProductSansBold),
                                SizedBox(width: 5),
                                Text('Price', style: TextStyles.ProductSansRegular4),
                                SizedBox(width: 5),
                                Text('32.00 / KG', style: TextStyles.ProductSansBold),
                              ],
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                              height: 24,
                            ),
                            Text(
                              'Pickup address - ${task.pickupAddress}',
                              style: TextStyles.ProductSansBold4,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Shipping address - ${task.dropLocation}',
                              style: TextStyles.ProductSansBold4,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    backgroundColor: AppColors.buttoncolor,
                                    style: TextStyles.ProductSansBold3,
                                    text: 'Directions',
                                    onTap: () {
                                      controller.launchMaps(task.latitude, task.longitude);
                                      Get.toNamed('/Verificationcode_Page', arguments: {
                                        'drop_location': task.dropLocation,
                                        'Order_no': task.orderId
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: CustomButton1(
                                    backgroundColor: AppColors.whitecolor,
                                    style: TextStyles.ProductSansBold2,
                                    text: 'Call now',
                                    onTap: () {
                                      _makePhoneCall('+100');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
