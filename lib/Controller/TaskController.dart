import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../All_Custom_Faction/APIURL.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs; // Observable list to hold tasks

  @override
  void onInit() {
    super.onInit();
    fetchTasks(); // Fetch tasks when the controller is initialized
  }

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.tasks));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        print("==============${response.body}");
        tasks.value = jsonResponse.map((data) => Task.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      print(e);
      // Handle errors appropriately
    }
  }

  // Method to reload the data
  void reloadData() async {
    await fetchTasks(); // Reuse the fetchTasks method
  }

  void clearAllAddresses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void launchMaps(double lat, double lng) async {
    final String googleMapsUrl = '${ApiUrls.googlemapurl}$lat,$lng';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}

class Task {
  final String orderId;
  final int totalQuantity;
  final double latitude;
  final double longitude;
  final String pickupAddress;
  final String dropLocation;

  Task({
    required this.orderId,
    required this.totalQuantity,
    required this.latitude,
    required this.longitude,
    required this.pickupAddress,
    required this.dropLocation,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      orderId: json['order_id'],
      totalQuantity: json['total_quantity'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      pickupAddress: json['pickup_address'],
      dropLocation: json['drop_location'],
    );
  }
}
