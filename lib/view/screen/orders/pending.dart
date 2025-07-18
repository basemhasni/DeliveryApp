

import 'package:delivery/controller/orders/pending_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Container(
          padding:  EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
            builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder:(context, index) => CardOrdersList(listdata: controller.data[index]),
            ),)
          ),

        );
  }
}
