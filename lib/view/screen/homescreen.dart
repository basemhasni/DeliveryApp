
import 'dart:io';

import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: Text("Orders")),
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope(child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(title: "Warning",
                    titleStyle:const TextStyle(fontWeight: FontWeight.bold,color:AppColor.primaryColor ),
                    middleText: "Do You Want To Exit The app",
                    onCancel: () {},
                    onConfirm: () {exit(0);},
                    cancelTextColor: AppColor.secondColor,
                    confirmTextColor: AppColor.secondColor,
                    buttonColor: AppColor.thirdColor
                );
                return Future.value(false);
              },),
        ));
  }
}
