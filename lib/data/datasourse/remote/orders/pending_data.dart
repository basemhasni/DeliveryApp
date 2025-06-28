



import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingorders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String deliveryid , String orderid) async {
    var response = await crud.postData(AppLink.ordersapprove, {
      "deliveryid" : deliveryid ,
      "ordersid" : orderid
    });
    return response.fold((l) => l, (r) => r);
  }



}