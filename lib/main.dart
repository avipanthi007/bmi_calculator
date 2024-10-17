import 'package:bmi_calculator/core/utils/init_controller.dart';
import 'package:bmi_calculator/features/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
  await initControllers();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
