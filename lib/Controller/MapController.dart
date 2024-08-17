import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapController extends GetxController {
  var center = Rx<LatLng?>(null);
  var currentLocation = RxString('');
  var markers = <Marker>[].obs;
  var polylines = <Polyline>[].obs;
  var nearbydestination = <Map<String, dynamic>>[].obs;
  var customIcon = Rx<BitmapDescriptor?>(null);
  final String apiKey = 'AIzaSyDZWSWa5kSdIu0342P4VKoY2HTsBg3SNlE';
  late GoogleMapController mapController;
  var fixedDestinationName = 'Woodland Park'.obs;
  var selectedDestination = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    loadDestinations();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      currentLocation.value = '${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    }

    markers.add(
      Marker(
        markerId: MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  Future<void> getDirections(LatLng destination) async {
    if (center.value == null) return;

    final origin = '${center.value!.latitude},${center.value!.longitude}';
    final dest = '${destination.latitude},${destination.longitude}';

    final response = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$dest&key=$apiKey',
    ));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'OK') {
        final polyline = data['routes'][0]['overview_polyline']['points'];
        final points = PolylinePoints().decodePolyline(polyline);
        polylines.add(
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            points: points.map((point) => LatLng(point.latitude, point.longitude)).toList(),
            width: 5,
          ),
        );

        // Update the camera to show the route
        final bounds = LatLngBounds(
          southwest: LatLng(
            points.map((p) => p.latitude).reduce((a, b) => a < b ? a : b),
            points.map((p) => p.longitude).reduce((a, b) => a < b ? a : b),
          ),
          northeast: LatLng(
            points.map((p) => p.latitude).reduce((a, b) => a > b ? a : b),
            points.map((p) => p.longitude).reduce((a, b) => a > b ? a : b),
          ),
        );
        mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
      }
    } else {
      // Handle error
      print('Failed to load directions');
    }
  }

  void selectDestination(Map<String, dynamic> destination) {
    selectedDestination.value = destination;
  }

  void loadDestinations() {
    nearbydestination.value = [
      {
        'Destinationlocationname': 'Albert Hall Museum',
        'location': LatLng(26.9124, 75.7873),
      },
      {
        'Destinationlocationname': 'City Palace',
        'location': LatLng(26.9258, 75.8267),
      },
      {
        'Destinationlocationname': 'Hawa Mahal',
        'location': LatLng(26.9239, 75.8267),
      },
      // Add more destinations as needed
    ];
  }
}
