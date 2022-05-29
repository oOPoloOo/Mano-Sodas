import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';

import '../helpers/validator.dart';

class PlantsRetrievalMiddleware extends GetMiddleware {
  final plantsController = PlantsController.to;
  final authController = AuthController.to;

  
   updatePlants(String? route) {
    //if(authController.authenicated.value == false) {return  RouteSettings(name: '/register'); }

    var email = authController.localStorage.read("emailAddress").toString();
    var password = authController.localStorage.read("password").toString();
    var deviceSerial = authController.localStorage.read("deviceSerial").toString();
   

    if (Validator().emailControl(email) && password.isNotEmpty && deviceSerial.isEmpty) {
      var devSerial = authController.findDeviceSerialByUserEmail(email);
      plantsController.getUserCameras(devSerial);
    }    
  }
}
