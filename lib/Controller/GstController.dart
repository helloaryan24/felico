import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GstController extends GetxController {
  var gamil = ''.obs;
  final nameController = TextEditingController();
  RxBool policyAccepted = false.obs; // Observable for policy acceptance


}