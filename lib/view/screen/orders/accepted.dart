

import 'package:delivery/controller/orders/accepted_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/view/widget/orders/orderslistcaardaccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Container(
      padding:  EdgeInsets.all(10),
      child: GetBuilder<OrdersAcceptedController>(
          builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder:(context, index) => CardOrdersListAccepted(listdata: controller.data[index]),
          ),)
      ),

    );
  }
}
