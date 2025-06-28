



import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viewordersaccepted, {"id": deliveryid});
    return response.fold((l) => l, (r) => r);
  }


  donedeliveryData(String ordersid ) async {
    var response = await crud.postData(AppLink.ordersdone, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }


}