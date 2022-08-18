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

  List<Camera> camerasDeviceData = <Camera>[];
  List<Camera> activeCameras = <Camera>[];
  List<Camera> notActiveCameras = <Camera>[];
  //var activeCamCnt = 0.obs;

// naudosiu RXList list.assignAll(new list), -jei dedu visus elemt is kart
  // kuri pakeicia visus esancius elementus naujais
  void updateCameras() async {
    activeCameras.clear();
    notActiveCameras.clear();

    for (var camera in camerasDeviceData) {
      if (camera.assigned == true) {
        activeCameras.add(camera);
      }
      if (camera.assigned == false) {
        notActiveCameras.add(camera);
      }
    }
    update();
  }

  getUserCamerasBySerial(String devSerial) async {
    try {
      camerasDeviceData =
          await userRepo.getAllUserCamerasByDeviceSerial(devSerial);

      //update active/nonactive cameras list
      updateCameras();

    } on dio.DioError catch (e) {
      PlantsScreen.showSnackBar(
          "Klaidos zinute: ${e.response!.data['message']}", // Taip prieinama klaidos resp data
          "Klaidos kodas: ${e.response!.statusCode}");
    }
  }

  findDeviceSerialByUserEmail(String email) async {
    try {
      String devSerial = await userRepo.getUserDeviceSerialByEmail(email);
      return devSerial;
    } on dio.DioError catch (e) {
      logger.d(e);
    }
  }

  setCameraActive(String camSerial) async {
    try {
      var devSerial = await userRepo.updateCameraToActive(camSerial);
      return devSerial;
    } on dio.DioError catch (e) {
      logger.d(e);
    }
  }

  setCameraInactive(String email) async {
    try {
      var devSerial = await userRepo.updateCameraToInactive(email);
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
