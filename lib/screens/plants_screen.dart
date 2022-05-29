// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:mano_sodas_final/constants/constants.dart';
import 'package:get/get.dart' as getx;
// import 'package:mano_sodas_final/widgets/allPlants.widget.dart';

import '../controllers/controllers.dart';
import '../model/user.cameras.response.dart';
import '../widgets/addPlant.listTile.dart';
import '../widgets/plant.widget.dart';

class PlantsScreen extends StatelessWidget {
  // const Plants({ Key? key }) : super(key: key);
  final PlantsController plantCon = PlantsController.to;

  static showSnackBar(String guiMsg, String error) {
    getx.Get.snackbar(guiMsg, error,
        snackPosition: getx.SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6)
        // animationDuration: Duration(seconds: 10)// lagina ir nevisada islenda iki galo
        );
  }

  @override
  Widget build(BuildContext context) {
    // Jei tik kameros butu be device
    var camerasCnt = plantCon.camerasDeviceData.length;
    var allCamerasList = plantCon.camerasDeviceData;
    List<Camera> activeCamerasList = [];

    for (var camera in allCamerasList) {
      if (camera.assigned == true) {
        activeCamerasList.add(camera);
      }
    }
    plantCon.activeCamCnt.value = activeCamerasList.length;

    //meta klaida, nes tuscias o bandau paimt ilgi

    // var camerasCnt =  plantController.camerasDeviceData[0].cameras!.length;
    // var camerasList = plantController.camerasDeviceData[0].cameras;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Augalai'),      
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              () {
                if (plantCon.activeCamCnt.value == 0) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: plantCon.activeCamCnt.value + 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return AddPlantListTile();
                      }
                      if (index == 1) {
                        return Center(
                          child:  Column(
                            children: const [
                              SizedBox(width: 0, height: 250),
                              Text(
                                'Nėra kamerų priskirtų stebėti augalus',
                                style: TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            ],
                          ),
                        );
                      }
                      plantCon.activeCamCnt.value -= 2;
                      return Plant(activeCamerasList, index);
                    },
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: plantCon.activeCamCnt.value + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return AddPlantListTile();
                      }
                      plantCon.activeCamCnt.value -= 1;
                      return Plant(activeCamerasList, index);
                    },
                  );
                }
              }(),
            ],
          ),
        ),
      ),
    );
  }
}
