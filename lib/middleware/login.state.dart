// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mano_sodas_final/constants/constants.dart';
import 'package:mano_sodas_final/controllers/controllers.dart';
import 'package:mano_sodas_final/router/routes.dart';

class AuthMiddleware extends GetMiddleware { 

  final authController = AuthController.to;


@override
  RouteSettings? redirect(String? route) {
     
    print("INSIDE MIDDLEWARE, validated: ${authController.authenicated.value}");
    if(authController.authenicated.value == false) {return  RouteSettings(name: createAccountRouteName); }
      
  }


// @override
//   RouteSettings? redirect(String? route) {
//      print("redirect(Middleware): authenicated.value : ${authController.authenicated.value}");
//     return authController.authenicated.value 
//         ? null
//         : RouteSettings(name: '/login');
//   }

// @override // Pirmas var be klaidu
//   RouteSettings? redirect(String? route) {
//     return authController.authenicated.value || route == '/login'
//         ? null
//         : RouteSettings(name: '/login');
//   }

  //  @override redirect() { 
  //     if(authController.authenicated.isFalse){ 
  //        return RouterSettings(route: '/dashboard'); } return null; 
  //     }  
  //  }
}