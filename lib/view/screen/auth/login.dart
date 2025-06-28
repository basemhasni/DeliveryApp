

import 'package:delivery/controller/auth/login_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/functions/alertexitapp.dart';
import 'package:delivery/core/functions/validinput.dart';
import 'package:delivery/view/widget/auth/custombuttonauth.dart';
import 'package:delivery/view/widget/auth/customtextbodyauth.dart';
import 'package:delivery/view/widget/auth/customtextformauth.dart';
import 'package:delivery/view/widget/auth/customtexttitleauth.dart';
import 'package:delivery/view/widget/auth/logoauth.dart';
import 'package:delivery/view/widget/auth/textsignuporlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) =>
            HandlingDataRequest (statusRequest: controller.statusRequest!, widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(children: [
                const LogoAuth(),
                const SizedBox(height: 20) ,
                const CustomTextTitleAuth(text: "Welcome Back"),
                const SizedBox(height: 10),
                const CustomTextBodyAuth(
                    text:
                    "Sign In With Your Email And Password OR Continue With Social Media"),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 60, "email");
                  },
                  isNumber: false,
                  hinttext: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  labeltext: "Email",
                  mycontroller: controller.email ,
                ),
                GetBuilder<LoginControllerImp>(builder: (controller) => CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  isNumber: false,
                  obscureText: controller.isshowpassword,
                  onTapIcon: (){
                    controller.showPassword();
                  },
                  hinttext: "Enter Your Password",
                  iconData: Icons.lock_outline,
                  labeltext: "Password",
                  mycontroller: controller.password,
                ),),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: const Text(
                    "Forget Password",
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButtonAuth(text: "Sign In", onPressed: () {
                  controller.login();
                }),
                SizedBox(height: 30),
                CustomTextSignUpOrSignIn(textone: "Don't have an account ? ",
                  texttwo: "SignUp",
                  onTap: () {
                    controller.goToSignUp();

                  },
                )
              ]),
            ),
          ))
        ), )
    );
  }
}
