import 'package:get/get.dart';

import '../All_Custom_Faction/Image.dart';

class CategoryController extends GetxController {
  final materials = [
    {'image':  Images.plastic, 'name': 'PET'},
    {'image': Images.plastic, 'name': 'HDPE'},
    {'image': Images.plastic, 'name': 'PP'},
    {'image': Images.plastic, 'name': 'HIPS'},
    {'image': Images.plastic, 'name': 'LDPE'},
    {'image': Images.plastic, 'name': 'PC'},
    {'image': Images.plastic, 'name': 'PS'},
    {'image': Images.plastic, 'name': 'PVC'},
    {'image': Images.plastic, 'name': 'MLP'},
    {'image': Images.plastic, 'name': 'PLASTIC'},
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
