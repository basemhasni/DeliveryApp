





import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/middleware/mymiddleware.dart';
import 'package:delivery/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:delivery/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/auth/signup.dart';
import 'package:delivery/view/screen/auth/success_signup.dart';
import 'package:delivery/view/screen/auth/verifycodesignup.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/orders/details.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Login()  ,
      middlewares: [MyMiddleWare()]
  ),
  //GetPage(name: "/", page: () =>  Cart()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),

  GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),

  //home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),


  // //Orders

   GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  // GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  // GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),

];