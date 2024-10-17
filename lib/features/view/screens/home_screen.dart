import 'package:bmi_calculator/features/view/screens/result_screen.dart';
import 'package:bmi_calculator/features/view_model/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.find<HomeScreenViewmodel>();

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[800],
          title: const Text("BMI Calculator",
              style: TextStyle(fontSize: 30, color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  kRepeatedCard(
                    onTap: () {
                      homeViewModel.selectMale.value =
                          !homeViewModel.selectMale.value;
                      homeViewModel.selectFemale.value =
                          !homeViewModel.selectFemale.value;
                    },
                    height: Get.height * 0.26,
                    width: Get.width * 0.45,
                    color: homeViewModel.selectMale.value
                        ? Colors.grey
                        : Colors.grey[800],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  kRepeatedCard(
                    onTap: () {
                      homeViewModel.selectMale.value =
                          !homeViewModel.selectMale.value;
                      homeViewModel.selectFemale.value =
                          !homeViewModel.selectFemale.value;
                    },
                    height: Get.height * 0.26,
                    width: Get.width * 0.45,
                    color: homeViewModel.selectFemale.value
                        ? Colors.grey
                        : Colors.grey[800],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 100,
                          color: Colors.white,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              kRepeatedCard(
                  color: Colors.grey[800],
                  height: Get.height * 0.26,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        homeViewModel.height.value.toString(),
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          activeColor: Colors.red,
                          value: homeViewModel.height.value,
                          min: 100,
                          max: 250,
                          divisions: 150,
                          label: homeViewModel.height.value.toString(),
                          onChanged: (val) {
                            homeViewModel.height.value = val;
                          }),
                    ],
                  )),
              Row(
                children: [
                  kRepeatedCard(
                      height: Get.height * 0.28,
                      width: Get.width * 0.45,
                      color: Colors.grey[800],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            homeViewModel.weight.value.toString(),
                            style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                    onPressed: () {
                                      if (homeViewModel.weight.value >= 5) {
                                        homeViewModel.weight.value--;
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                    onPressed: () {
                                      homeViewModel.weight.value++;
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        ],
                      )),
                  kRepeatedCard(
                      height: Get.height * 0.28,
                      width: Get.width * 0.45,
                      color: Colors.grey[800],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            homeViewModel.age.value.toString(),
                            style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                    onPressed: () {
                                      if (homeViewModel.age.value > 15) {
                                        homeViewModel.age.value--;
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                    onPressed: () {
                                      homeViewModel.age.value++;
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            homeViewModel.calculate();
          },
          child: Container(
            height: 60,
            color: Colors.red,
            child: const Center(
              child: Text(
                "CALCULATE",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector kRepeatedCard(
      {double? height,
      double? width,
      Widget? child,
      Function()? onTap,
      Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: color),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
