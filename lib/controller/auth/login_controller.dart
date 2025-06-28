

import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/handlingdatacontroller.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasourse/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController{

  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  
  StatusRequest? statusRequest = StatusRequest.none ;
  
  MyServices myServices = Get.find();

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  


  @override
  goToSignUp() {
      Get.offNamed(AppRoute.signUp);
  }

  @override
  login() async{
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await loginData.postdata(email.text , password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['delivery_approve'] == "1"){
            myServices.sharedPreferences.setString("id", response['data']['delivery_id']) ;
            myServices.sharedPreferences.setString("username", response['data']['delivery_name']) ;
            myServices.sharedPreferences.setString("email", response['data']['delivery_email']) ;
            myServices.sharedPreferences.setString("phone", response['data']['delivery_phone']) ;
            myServices.sharedPreferences.setString("step","2") ;
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            Get.offNamed(AppRoute.homepage);
          }
          else{
            Get.offNamed(AppRoute.verifyCode , arguments: {"email" : email.text});
          }
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  goToForgetPassword() {

    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }




}