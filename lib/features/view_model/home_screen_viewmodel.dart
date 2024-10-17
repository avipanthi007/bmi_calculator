import 'package:bmi_calculator/features/view/screens/result_screen.dart';
import 'package:get/get.dart';

class HomeScreenViewmodel extends GetxController {
  final selectMale = true.obs;
  final selectFemale = false.obs;
  final height = 150.0.obs;
  final weight = 30.obs;
  final age = 20.obs;

  calculate() {
    double baseHeight = (height / 100) * (height / 100);
    double result = weight / baseHeight;
    Get.to(() => ResultScreen(
          result: result,
        ));
    
  }

  valueReset() {
    height.value = 150;
    weight.value = 30;
    age.value = 20;
    update();
  }
}
