import 'package:delivery/view/screen/home.dart';
import 'package:delivery/view/screen/orders/archive.dart';
import 'package:delivery/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/orders/accepted.dart';


abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),


  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.pending_actions_outlined},
    {"title": "Accepted", "icon": Icons.verified_outlined},
    {"title": "Archive", "icon": Icons.archive_outlined},

  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
