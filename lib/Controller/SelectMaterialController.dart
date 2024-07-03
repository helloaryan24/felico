import 'package:get/get.dart';

import '../All_Custom_Faction/Image.dart';

class MaterialController extends GetxController {
  final materials = [
    {'image':  Images.plastic, 'name': 'Plastic'},
    {'image': Images.plastic, 'name': 'Paper'},
    {'image': Images.plastic, 'name': 'Metal'},
    {'image': Images.plastic, 'name': 'E-waste'},
    // Add more materials here
  ].obs;

  var selectedMaterial = ''.obs;

  void selectMaterial(String name) {
    if (selectedMaterial.value == name) {
      selectedMaterial.value = ''; // Deselect if already selected
    } else {
      selectedMaterial.value = name; // Select new material
    }
  }
}
