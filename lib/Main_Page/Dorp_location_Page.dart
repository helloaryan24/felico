import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Droping_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dropLocation = Get.arguments['drop_location'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Location Page'),
      ),
      body: Center(
        child: Text('Drop Location: $dropLocation'),
      ),
    );
  }
}

