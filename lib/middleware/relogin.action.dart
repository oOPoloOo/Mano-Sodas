
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';


class ReloginMiddleware extends GetMiddleware { 

  final authController = AuthController.to;



  relogin(String? route) {
     
    
    //if(authController.authenicated.value == false) {return  RouteSettings(name: '/register'); }
 
     var email = authController.localStorage.read("emailAddress").toString();
    var password = authController.localStorage.read("password").toString();

    email.isNotEmpty && password.isNotEmpty
        ? authController.loginUser(email, password)
        : {};
  }
     
}
























