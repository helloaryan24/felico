// import 'package:felico/All_Custom_Faction/Colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../All_Custom_Faction/All_Widget.dart';
// import '../All_Custom_Faction/TextStyle.dart';
// import '../Controller/GstController.dart';
// import '../Controller/NameInputController.dart';
//
// class GstScreen extends StatelessWidget {
//   final GstController gstcontroller = Get.put(GstController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child:   CustomButton(
//             backgroundColor: AppColors.buttoncolor,
//             style: TextStyles.ProductSansBold1,
//             text: 'Proceed',
//             onTap: () {
//               Get.toNamed('/PickupAddress_Page');
//             },
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80, top: 0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start, // Center the content vertically
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 100), // Add some space at the top
//                 Text(
//                   'Choose GSTIN  Details',
//                   style: TextStyles.ProductSansBold,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Enter  details to see right price from  verified buyers !',
//                   style: TextStyles.ProductSansRegular,
//                 ),
//                 SizedBox(height: 50),
//                 Text(
//                   'Choose the GSTIN  Details',
//                   style: TextStyles.ProductSansRegular1,
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Obx(() => SizedBox(
//                       height: 25,width: 25,
//                       child: Checkbox(
//                         activeColor: AppColors.buttoncolor,
//                         value: gstcontroller.policyAccepted.value,
//                         onChanged: (value) {
//                           gstcontroller.policyAccepted.value =
//                           value!;
//                         },
//                       ),
//                     )),
//                     SizedBox(width: 10,),
//                     Text('ZOOM\nEARTH EXPRESS LLP\n09AADFZ7195C1Z5\nUttar Pardesh',
//                         style: TextStyles.ProductSansRegular1),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:felico/All_Custom_Faction/Colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../All_Custom_Faction/All_Widget.dart';
// import '../All_Custom_Faction/TextStyle.dart';
// import '../Controller/GstController.dart';
//
// class GstScreen extends StatelessWidget {
//   final GstController gstcontroller = Get.put(GstController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: CustomButton(
//             backgroundColor: AppColors.buttoncolor,
//             style: TextStyles.ProductSansBold1,
//             text: 'Proceed',
//             onTap: () {
//               Get.toNamed('/PickupAddress_Page');
//             },
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80, top: 0),
//             child: Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 100), // Add some space at the top
//                 Text(
//                   'Choose GSTIN  Details',
//                   style: TextStyles.ProductSansBold,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Enter  details to see right price from  verified buyers !',
//                   style: TextStyles.ProductSansRegular,
//                 ),
//                 SizedBox(height: 50),
//                 Text(
//                   'Choose the GSTIN  Details',
//                   style: TextStyles.ProductSansRegular1,
//                 ),
//                 SizedBox(height: 10),
//                 Flex(
//                   direction: Axis.horizontal,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Obx(() => SizedBox(
//                       height: 25, width: 25,
//                       child: Checkbox(
//                         activeColor: AppColors.buttoncolor,
//                         value: gstcontroller.policyAccepted.value,
//                         onChanged: (value) {
//                           gstcontroller.policyAccepted.value = value!;
//                         },
//                       ),
//                     )),
//                     SizedBox(width: 10,),
//                     Flexible(
//                       child: Text(
//                         'ZOOM\nEARTH EXPRESS LLP\n09AADFZ7195C1Z5\nUttar Pardesh',
//                         style: TextStyles.ProductSansRegular1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:felico/All_Custom_Faction/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/GstController.dart';

class GstScreen extends StatelessWidget {
  final GstController gstcontroller = Get.put(GstController());

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
              Get.toNamed('/PickupAddress_Page');
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80, top: 0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100), // Add some space at the top
                Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose GSTIN  Details',
                      style: TextStyles.ProductSansBold,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter details to see right price from  verified buyers!',
                      style: TextStyles.ProductSansRegular,
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Choose the GSTIN  Details',
                      style: TextStyles.ProductSansRegular1,
                    ),
                    SizedBox(height: 10),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => SizedBox(
                          height: 25, width: 25,
                          child: Checkbox(
                            activeColor: AppColors.buttoncolor,
                            value: gstcontroller.policyAccepted.value,
                            onChanged: (value) {
                              gstcontroller.policyAccepted.value = value!;
                            },
                          ),
                        )),
                        SizedBox(width: 10,),
                        Flexible(
                          child: Text(
                            'ZOOM\nEARTH EXPRESS LLP\n09AADFZ7195C1Z5\nUttar Pardesh',
                            style: TextStyles.ProductSansRegular1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
