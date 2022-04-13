import 'dart:async';

import 'package:e_commerce_project/configration/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Get.offAndToNamed(AppRoutes.HOME_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Text(
            "Splash Screen",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
