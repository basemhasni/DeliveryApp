


import 'package:delivery/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());
    return  GetBuilder(builder: (controller) =>
        Scaffold(body: Center(child: Text("homee")),)
    );


  }
}



