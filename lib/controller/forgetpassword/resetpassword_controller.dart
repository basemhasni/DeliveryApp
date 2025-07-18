

import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/handlingdatacontroller.dart';
import 'package:delivery/data/datasourse/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());


  StatusRequest? statusRequest = StatusRequest.none ;
  late TextEditingController password;
  late TextEditingController repassword;

  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  String? email;


  @override
  resetpassword() {

  }

  @override
  goToSuccessResetPassword()async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.successResetpassword);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}