// ignore_for_file: prefer_const_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';


//Returns list tile
class AddPlantListTile extends StatelessWidget {  

  //Konstruktorius priskiria ivesties argumenta  vietiniam kintamajam
  AddPlantListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // ignore: prefer_const_literals_to_create_immutables
      title: Column(children: [
        Text("Pridėti augalą", style: TextStyle(fontSize: 26)),
      ]),
      tileColor: Colors.grey,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            // Pasalinimo mygtukas
            icon: Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () => {Get.toNamed(addPlantRouteName)},
          ),
        ],
      ),
    );
  }
}
