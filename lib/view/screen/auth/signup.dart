
import 'package:delivery/controller/auth/signup_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/functions/alertexitapp.dart';
import 'package:delivery/core/functions/validinput.dart';
import 'package:delivery/view/widget/auth/textsignuporlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Sign Up',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
       onWillPop: alertExitApp,
      child: GetBuilder<SignUpControllerImp>(builder: (controller) =>
        HandlingDataRequest(statusRequest: controller.statusRequest!, widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const SizedBox(height: 20) ,
              const CustomTextTitleAuth(text: "Welcome Back"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(
                  text:
                  "Sign In With Your Email And Password OR Continue With Social Media"),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                hinttext: "Enter Your Username",
                valid: (val) {
                  return validInput(val!, 5, 60, "username");
                },
                isNumber: false,
                iconData: Icons.person_outline,
                labeltext: "Username",
                mycontroller: controller.username,
              ),
              CustomTextFormAuth(
                hinttext: "Enter Your Email",
                valid: (val) {
                  return validInput(val!, 5, 60, "email");
                },
                isNumber: false,
                iconData: Icons.email_outlined,
                labeltext: "Email",
                mycontroller: controller.email,
              ),
              CustomTextFormAuth(
                hinttext: "Enter Your Phone",
                valid: (val) {
                  return validInput(val!, 5, 15, "phone");

                },
                isNumber: true,
                iconData: Icons.phone,
                labeltext: "Phone",
                mycontroller:controller.phone ,
              ),
              CustomTextFormAuth(
                hinttext: "Enter Your Password",
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                isNumber: false,
                obscureText: controller.isshowpassword,
                onTapIcon: (){
                  controller.showPassword();
                },
                iconData: Icons.lock_outline,
                labeltext: "Password",
                mycontroller: controller.password,
              ),

              CustomButtonAuth(text: "Sign Up", onPressed: () {
                controller.signUp();
              }),
              SizedBox(height: 30),
              CustomTextSignUpOrSignIn(textone:" have an account ? " ,
                texttwo: "Sign In",
                onTap: (){
                  controller.goToSignIn();
                },
              )


            ]),
          ),
        ))
        )
      )
    );
  }
}