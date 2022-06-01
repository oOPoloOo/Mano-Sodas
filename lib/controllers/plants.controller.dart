import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart' as dio;

import 'package:mano_sodas_final/screens/plants_screen.dart';
import '../api/client.dart';
import '../model/user.cameras.response.dart';
import '../repository/user.repository.dart';

class PlantsController extends GetxController {
  TextEditingController deviceSerialController = TextEditingController();

  UserRepository userRepo = Get.find();
  static PlantsController to = Get.find<PlantsController>();

  List<Camera> camerasDeviceData = <Camera>[].obs;
  var activeCamCnt = 0.obs;

  getUserCamerasBySerial(String devSerial) async {
    try {
      //Cia nieko nepriskiria nes doumenys neateini iki model mappinimui
      camerasDeviceData =
          await userRepo.getAllUserCamerasByDeviceSerial(devSerial);
    } on dio.DioError catch (e) {
      PlantsScreen.showSnackBar(
          // Future.doWhile(() => null)
          "Klaidos zinute: ${e.response!.data['message']}", // Taip prieinama klaidos resp data
          "Klaidos kodas: ${e.response!.statusCode}");
    }
  }


  findDeviceSerialByUserEmail(String email) async {
    try {
      //Cia devSErial 15
     String devSerial =  await userRepo.getUserDeviceSerialByEmail(email);   
     return devSerial;
      
    } on dio.DioError catch (e) {
       logger.d(e);
    }
  }

  clearCamerasData() {
    //ISVALO KAMERU DUOMENIS    
    camerasDeviceData.clear();
  }
}
