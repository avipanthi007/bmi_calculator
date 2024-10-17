import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatefulWidget {
  double result;
  ResultScreen({super.key, required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  initState() {
    chekNormal();
    super.initState();
  }

  String isNormal = "";
  String message = "";

  chekNormal() {
    if (widget.result < 18.5) {
      isNormal = "Underweight";
      message = "You are underweight";
    } else if (widget.result > 25) {
      isNormal = "Overweight";
      message = "You are overweight";
    } else {
      isNormal = "Normal";
      message = "You have a normal body weight";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[800],
        title: Text(
          "Your Result",
          style: const TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          color: Colors.grey[700],
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  isNormal,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue[300],
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                widget.result.toStringAsFixed(2),
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                message,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 60,
          color: Colors.red,
          child: Center(
            child: Text("RE-CALCULATE",
                style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
        ),
      ),
    );
  }
}
