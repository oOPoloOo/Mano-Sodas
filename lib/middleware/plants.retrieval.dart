// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/parse_route.dart';
// import 'package:mano_sodas_final/controllers/controllers.dart';
// import 'package:mano_sodas_final/router/routes.dart';
// import '../constants/constants.dart';
// import '../helpers/validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// class PlantsRetrievalMiddleware extends GetMiddleware {
//   final plantsController = PlantsController.to;
//   final authController = AuthController.to;

// // naudojau ne ta metoda
// //RouteSettings? redirect(String? route) {
//  @override
  
//   //grazina page anksciau nei gauna duomenis is serverio
//   //Sitas metodas negali but synch ir nelaukia, kol gausiu reiksme devSerial
//   //Widget onPageBuilt(Widget page) { //veikia, bet reikia async
//  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {

//     //GetPage onPageCalled(GetPage page) {
//     print("INSIDE PlantsRetrievalMiddleware (onPageBuilt)");
//     var email = authController.localStorage.read("emailAddress").toString();
//     var password = authController.localStorage.read("password").toString();
//     var deviceSerial =
//         authController.localStorage.read("deviceSerial").toString();
//     //var goToPage = false;



//   if (Validator().emailControl(email) &&
//         password.isNotEmpty &&
//         (deviceSerial.isEmpty || deviceSerial == "Instance of 'Future<dynamic>'")) {
//       //dev serial future<dynamic> nera dev serial
//       var devSerial =  plantsController.findDeviceSerialByUserEmail(email);

//       //Atnaujinu deviceSerial reiksme saugykloj
//       authController.localStorage.write("deviceSerial", devSerial);
//       //Nuskaitau atnaujinta reiksme
//       deviceSerial =
//           authController.localStorage.read("deviceSerial").toString();      
//     }
//     //Atnaujina duomenis kiekviena kart 
//     if (deviceSerial.isNotEmpty) {
//         plantsController.getUserCamerasBySerial(deviceSerial);
//         //goToPage = true;
//       }

    
//     //goToPage = true;
    

//     //Lyg grazina page anksciau nei gauna data,
//     // bet reik isbandyt pridejus kameru i langa Augalai

//     return  page;
//   }
// }
