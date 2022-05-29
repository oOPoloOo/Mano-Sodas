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
    var camerasCnt = plantCon.camerasDeviceData.length;
    var allCamerasList = plantCon.camerasDeviceData;
    List<Camera> activeCamerasList = [];

    for (var camera in allCamerasList) {
      if (camera.assigned == true) {
        activeCamerasList.add(camera);
      }
    }

    var activeCamCnt = activeCamerasList.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Augalai'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: () {
            if (activeCamCnt == 0) {
              //
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: activeCamCnt + 2, //
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AddPlantListTile();
                  }
                  if (index == 1) {
                    return Center(
                      child: Column(
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

                  index -= 2;
                  return SizedBox(width: 0, height: 0);
                },
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: activeCamCnt + 1, //
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AddPlantListTile();
                  }

                  index -= 1;
                  return Plant(activeCamerasList, index);
                },
              );
            }
          }(),
        ),
      ]),
    );
  }
}
