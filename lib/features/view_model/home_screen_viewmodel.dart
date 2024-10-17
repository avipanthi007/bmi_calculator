import 'package:get/get.dart';

class HomeScreenViewmodel extends GetxController {
  final isLoading = false.obs;
  final selectMale = true.obs;
  final selectFemale = false.obs;
  final height = 150.0.obs;
  final weight = 30.obs;
  final age = 20.obs;
}
