import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart' as dio;

import 'package:mano_sodas_final/screens/plants_screen.dart';
import '../model/user.cameras.response.dart';
import '../repository/user.repository.dart';

class PlantsController extends GetxController {
  TextEditingController deviceSerialController = TextEditingController();

  UserRepository userRepo = Get.find();
  static PlantsController to = Get.find<PlantsController>();

  // A nullable Rx instance of Cameras. Initial value is null.
  //Rxn<UserCamerasResponse> camerasData = Rxn();
//  RxList<UserCamerasResponse> camerasData = (List<UserCamerasResponse>.of([])).obs;
// RxList<UserCamerasResponse> camerasData = (List<UserCamerasResponse>.of([])).obs;

//Mete klaida nes grazino tik Camera, o bandziau skaityt, kaip kamera + device (UserCamerasResponse)
  List<Camera> camerasDeviceData = <Camera>[].obs;
  var activeCamCnt = 0.obs;
  //getteris
  // get cameras => camerasData;

  //Su dviem parametrais
  // String get cameras =>
  //       "${camerasData.value?.serialNumber}, ${camerasData.value?.deviceId}";

  //Order important || reikia kai prisijungia, o ne iskart
  // @override
  // void onInit() async {
  //   super.onInit();
  //   await getUserCameras();
  // }

  getUserCameras(String devSerial) async {
    try {
      //Cia nieko nepriskiria nes doumenys neateini iki model mappinimui
      camerasDeviceData = await userRepo.getAllUserCameras(devSerial);
    } on dio.DioError catch (e) {
      PlantsScreen.showSnackBar(
          // Future.doWhile(() => null)
          "Klaidos zinute: ${e.response!.data['message']}", // Taip prieinama klaidos resp data
          "Klaidos kodas: ${e.response!.statusCode}");
    }
  }

  clearCamerasData() {
    //ISVALO KAMERU DUOMENIS
    //Nezinau ar clear veikia
    // camerasDeviceData.clear();
  }
}
