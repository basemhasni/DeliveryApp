

import 'dart:io';

import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Attention",
      titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
      middleText: "Do you want to get out of the app",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child:const Text("Confirm")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child:const Text("Cancel"))
      ]);
  return Future.value(true);
}