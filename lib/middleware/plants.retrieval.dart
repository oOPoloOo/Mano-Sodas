// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';
import 'package:mano_sodas_final/router/routes.dart';
import '../constants/constants.dart';
import '../helpers/validator.dart';

class PlantsRetrievalMiddleware extends GetMiddleware {
  final plantsController = PlantsController.to;
  final authController = AuthController.to;

  @override
  RouteSettings? redirect(String? route) {
    //if(authController.authenicated.value == false) {return  RouteSettings(name: '/register'); }
    print("INSIDE PlantsRetrievalMiddleware");
    var email = authController.localStorage.read("emailAddress").toString();
    var password = authController.localStorage.read("password").toString();
    var deviceSerial =
        authController.localStorage.read("deviceSerial").toString();

    if (Validator().emailControl(email) &&
        password.isNotEmpty &&
        deviceSerial.isEmpty) {
      var devSerial = authController.findDeviceSerialByUserEmail(email);

       // neleidzia konvertuot reik awaitint su asybch
       //kitas dalykas gali but, kad neaprasyta findDeviceSerialByUserEmail
       String stringDevSerial =  devSerial;
      if (stringDevSerial.isNotEmpty) {
        plantsController.getUserCameras(devSerial);
      } else {
        return RouteSettings(name: plantsRouteName);
      }
    }

    return RouteSettings(name: plantsRouteName);
  }
}
