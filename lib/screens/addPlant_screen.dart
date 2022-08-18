// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:mano_sodas_final/constants/constants.dart';

import '../controllers/controllers.dart';
import '../model/user.cameras.response.dart';
import '../widgets/addPlant.listTile.dart';
import '../widgets/plant.widget.dart';
import '../widgets/plantAddScreen.listTile.dart';
import '../widgets/titleInactiveCameras.listTile.dart';

class AddPlantScreen extends StatelessWidget {
  // const Plants({ Key? key }) : super(key: key);
  final PlantsController plantCon = PlantsController.to;
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
        title: const Text('Pridėti augalą'),
      ),
      body: Column(
        children: <Widget>[
          Container(child: InactiveCamerasListTile()),
          Expanded(
            flex: 8,
            child: () {
              if (camerasCnt == 0) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: camerasCnt + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Center(
                        child: Column(
                          children: const [
                            SizedBox(width: 0, height: 250),
                            Text(
                              'Nėra kamerų nepriskirtų stebėti augalus',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }

                    index -= 1;
                    return SizedBox(width: 0, height: 0);
                  },
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: camerasCnt,
                  itemBuilder: (context, index) {
                    return PlantAddScreenListTile(allCamerasList, index);
                  },
                );
              }
            }(),
          ),
          Expanded(flex: 1, child: ListTile()),
          Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(child: () {
                    if (camerasCnt != 0) {
                      return Image(
                        image: AssetImage('Images/appleTreeCroped.jpg'),
                        height: 300,
                        width: 300,
                      );
                    } else {
                      return Text('Nuotraukų nėra');
                    }
                  }()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
