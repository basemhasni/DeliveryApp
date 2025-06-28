

import 'package:delivery/core/services/services.dart';
import 'package:get/get.dart';

TranslateDatabase(columnfr, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "fr") {
    return columnfr;
  } else {
    return columnen;
  }
}