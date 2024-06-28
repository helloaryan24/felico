import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Pickupaddresscontroller extends GetxController {
  var gamil = ''.obs;
  final pinController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  RxBool policyAccepted = false.obs; // Observable for policy acceptance

}