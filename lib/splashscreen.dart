import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form/FormScreen.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final globalController=Get.find<GlobalController>();


  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async{
        Get.off(FormScreen());


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.jpg'),
        // child: Text('Flutter Fusion'),
      )
    );
  }
}
