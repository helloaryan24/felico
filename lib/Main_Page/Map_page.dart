import 'package:felicodriver/All_Custom_Faction/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:felicodriver/All_Custom_Faction/Colors.dart';
import '../Controller/MapController.dart';

class Map_Page extends StatelessWidget {
  const Map_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());

    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Stack(
        children: [
          Obx(() {
            return controller.center.value != null
                ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controller.center.value!,
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              markers: {
                // Current Location Marker
                if (controller.center.value != null)
                  Marker(
                    markerId: MarkerId('currentLocation'),
                    position: controller.center.value!,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed),
                    infoWindow: InfoWindow(
                      title: 'Current Location',
                    ),
                  ),
                // Nearby Destinations Markers
                ...controller.nearbydestination.map((destination) {
                  return Marker(
                    markerId: MarkerId(
                        destination['Destinationlocationname']),
                    position: destination['location'],
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRose),
                    infoWindow: InfoWindow(
                      title: destination['Destinationlocationname'],
                    ),
                    onTap: () {
                      controller.selectDestination(destination);
                    },
                  );
                }).toSet(),
              },
              polylines: Set<Polyline>.of(controller.polylines),
              onMapCreated: (GoogleMapController gMapController) {
                controller.mapController = gMapController;
              },
            )
                : Center(child: CircularProgressIndicator());
          }),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Column(
              children: [
                // Current Location TextField
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.my_location, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Obx(() {
                          return TextField(
                            style: TextStyles.ProductSansBold,
                            controller: TextEditingController(
                                text: controller.currentLocation.value),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                // Fixed Destination TextField
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Obx(() {
                          return TextField(
                            style: TextStyles.ProductSansBold,
                            controller: TextEditingController(
                                text: controller.fixedDestinationName.value),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Obx(() {
        if (controller.selectedDestination.value != null) {
          return GestureDetector(
            onTap: () {
              LatLng destinationLocation =
              controller.selectedDestination.value!['location'];
              controller.getDirections(destinationLocation);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadiusDirectional.circular(8),
              ),
              child: Icon(
                Icons.navigation,
                color: Colors.white,
              ),
            ),
          );
        } else {
          return SizedBox.shrink(); // No button if no destination selected
        }
      }),
    );
  }
}
