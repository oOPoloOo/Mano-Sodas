import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mano_sodas_final/constants/constants.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';

class ReloginMiddleware extends GetMiddleware {
  final authController = AuthController.to;

//jei neoverridini metodo neveik
  @override
  RouteSettings? redirect(String? route) {
    print("INSIDE ReloginMiddleware");

    //if(authController.authenicated.value == false) {return  RouteSettings(name: '/register'); }

    var email = authController.localStorage.read("emailAddress").toString();
    var password = authController.localStorage.read("password").toString();

    //Bandymas vienas VEIKIA
    // email.isNotEmpty && password.isNotEmpty
    //     ? authController.loginUser(email, password)
    //     : {};

    if (email.isNotEmpty && password.isNotEmpty) {
      authController.authenicated.value = true;
      return const RouteSettings(name: homeRouteName);
    }

    return null;
  }
}
