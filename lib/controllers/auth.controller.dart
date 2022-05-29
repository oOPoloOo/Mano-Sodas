// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
// import 'package:get/instance_manager.dart';
// import 'package:get/state_manager.dart' ;// neimportint visos get bibliotekos
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import 'package:mano_sodas_final/api/client.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:mano_sodas_final/model/user.register.request.dart';
import 'package:mano_sodas_final/model/userdata.login.request.dart';
import 'package:mano_sodas_final/repository/user.repository.dart';
import 'package:mano_sodas_final/screens/auth/register.view.dart';
import 'package:mano_sodas_final/screens/ui.dart';

import "../screens/auth/login.view.dart";

import '../model/user.registered.response.model.dart';
import 'package:get/get.dart';

import 'plants.controller.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController deviceSerialController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  //UserRepository userRepo = UserRepository();
  UserRepository userRepo = Get.find();
  UserRegisteredResponse userRegResp = UserRegisteredResponse();
  //LoginView loginView = LoginView(); // brokes app
  var isFullData = false;
  var authenicated = false.obs;
  final loadingVisible = false.obs;

  static AuthController to = Get.find<AuthController>();
  final PlantsController plantsController = PlantsController.to;

  final localStorage = GetStorage('LocalStorage');

  // var settings = RxMap({
  //   "emailAddress": "",
  //   "password": "",
  //   "userDataID": "",
  //   "state": "",
  //   "city": "",
  //   "streetAddress": "",
  //   "mainDevice": "",
  //   "userID": "",
  // });

// @override
// void initState(){
//   localStorage.read('settings');
//   super.initState();
// }

  createAccount() async {
    loadingVisible.value = true;
    try {
      print(deviceSerialController.text);
      dio.Response resp = await userRepo.registerUser(UserRegistrationReq(
          emailAddress: emailController.text,
          password: passwordController.text,
          deviceSerial: deviceSerialController.text,
          city: cityController.text,
          state: stateController.text,
          streetAddress: streetAddressController.text));

      //Jei uzregistruotas saugau duomenis
      saveUserInfo(
          email: emailController.text,
          pass: passwordController.text,
          serial: deviceSerialController.text,
          city: cityController.text,
          state: stateController.text,
          street: streetAddressController.text);

      loginUser(emailController.text, passwordController.text);
      update();
    } on dio.DioError catch (e) {
      //logger.d(e);
      loadingVisible.value = false;
      RegisterView.showSnackBarRegister(
          // Future.doWhile(() => null)
          "Klaidos zinute: ${e.response!.data['message']}", // Taip prieinama klaidos resp data
          "Klaidos kodas: ${e.response!.statusCode}");
    }
  }

  loginUser(String email, String password) async {
    // logger.d(fullUserData);

    try {
      loadingVisible.value = true;

      dio.Response resp = await userRepo
          .loginUser(UserData(password: password, emailAddress: email));

      if (localStorage.read("emailAddress").toString() !=
          emailController.text) {
        saveUserInfo(
            email: emailController.text, pass: passwordController.text);
      }

      authenicated.value = true;

      if (localStorage.read("deviceSerial").isEmpty) {
        //gauti  kameras ir isaugot duomenis
      } else {
        var deviceSerial = localStorage.read("deviceSerial").toString();
        //Idetas laikinai kol nesutvarkytas emimas is bazes jei nera duom
        plantsController.getUserCameras(deviceSerial); // uzkraunu kameras
      }

      Get.offAll(HomeScreen());
      loadingVisible.value = false;

    } on dio.DioError catch (e) {
      //logger.d(e);
      loadingVisible.value = false;

      LoginView.showSnackBarLogin(
          "Klaidos zinute: ${e.response!.data['message']}", // Taip prieinama klaidos resp data
          "Klaidos kodas: ${e.response!.statusCode}");
    }
  }

  findDeviceSerialByUserEmail(String email) async {}

  saveUserInfo(
      {String? email,
      String? pass,
      String? serial,
      String? city,
      String? state,
      String? street}) {
    localStorage.write("emailAddress", emailController.text);
    localStorage.write("password", passwordController.text);
    localStorage.write("deviceSerial", deviceSerialController.text);
    localStorage.write("city", cityController.text);
    localStorage.write("state", stateController.text);
    localStorage.write("streetAddress", streetAddressController.text);
  }

  printData() {
    print(nameController.text);
    print(emailController.text);
    print(passwordController.text);
  }

  signOut() {
    //Isvalau saugykla
    saveUserInfo(
        email: "", pass: "", serial: "", city: "", state: "", street: '');
    plantsController.clearCamerasData();
    authenicated.value = false;
    Get.offAllNamed("/register");
    print("singn out: authenicated.value : ${authenicated.value}");
  }

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  // // Sign out
  // Future<void> signOut() {
  //   nameController.clear();
  //   emailController.clear();
  //   passwordController.clear();
  //   return _auth.signOut();
  // }
}
