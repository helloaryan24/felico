import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/PickupAddressController.dart';

class PickupAddress_Page extends StatelessWidget {
  final Pickupaddresscontroller pickupaddresscontroller =
  Get.put(Pickupaddresscontroller());

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
            text: 'Proceed',
            onTap: () {
              Get.toNamed('/AddBankAccountDetails_Page');
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Pickup Address',
                  style: TextStyles.ProductSansBold,
                ),
                SizedBox(height: 10),
                Text(
                  'Enter details so we can know you better!',
                  style: TextStyles.ProductSansRegular,
                ),
                SizedBox(height: 40),
                Text(
                  'Same as a billing address',
                  style: TextStyles.ProductSansRegular3,
                ),
                SizedBox(height: 10),
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => SizedBox(
                      height: 25,
                      width: 25,
                      child: Checkbox(
                        activeColor: AppColors.buttoncolor,
                        value: pickupaddresscontroller.policyAccepted.value,
                        onChanged: (value) {
                          pickupaddresscontroller.policyAccepted.value =
                          value!;
                        },
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        '20th Floor8202 Tower-8,\nPlot HG-02A,ATS Happy Trails,\nSector-10 Greater Noida\nUtter Pardesh Greater Noida 20130',
                        style: TextStyles.ProductSansRegular1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Enter detail so we can know better!',
                  style: TextStyles.ProductSansRegular,
                ),
                SizedBox(height: 30),
                Container(
                  color: AppColors.whitecolor,
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pincode*',
                          style: TextStyles.ProductSansRegular1,
                        ),
                        SizedBox(height: 10),
                        buildInputField(
                          hintText: 'Pincode',
                          controller: pickupaddresscontroller.pinController,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pickup Address*',
                              style: TextStyles.ProductSansRegular1,
                            ),
                            Text(
                              'Locate Me',
                              style: TextStyles.ProductSansRegular3,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        buildInputField(
                          hintText:
                          '20th Floor8202, Tower-8, Plot HG -02A,ATS......',
                          controller: pickupaddresscontroller.addressController,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 10),
                        buildInputField(
                          hintText: 'Sector-10  Greater-Noida',
                          controller: pickupaddresscontroller.stateController,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 10),
                        buildInputField(
                          hintText: 'Noida',
                          controller: pickupaddresscontroller.cityController,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
