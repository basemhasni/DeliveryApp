

import 'package:delivery/controller/auth/successresetpassword_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              )),
          Text("congratulations" , style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 30)),
          Text("Password has been reset successfully"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "Go To Login",
                onPressed: () {
                   controller.goToPageLogin();
                }),
          ),
          SizedBox(height: 30)
        ]),
      ),
    );
  }
}